import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/shared_widgets/custom_button.dart';
import 'package:grocery3/core/shared_widgets/custom_divider.dart';
import 'package:grocery3/core/utils/custom_toast.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/domain/entities/address_entity.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_event.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_state.dart';
import 'package:grocery3/features/profile/presentation/widgets/add_address_bottom_sheet.dart';
import 'package:grocery3/features/profile/presentation/widgets/address_item.dart';
import 'package:grocery3/features/profile/presentation/widgets/address_details_dialog.dart';

class DeliveryAddressesScreen extends StatefulWidget {
  const DeliveryAddressesScreen({super.key});

  @override
  State<DeliveryAddressesScreen> createState() =>
      _DeliveryAddressesScreenState();
}

class _DeliveryAddressesScreenState extends State<DeliveryAddressesScreen> {
  List<AddressEntity> _cachedAddresses = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileBloc>().add(GetAddressesEvent());
    });
  }

  Future<void> _showAddAddressBottomSheet(BuildContext context) async {
    final profileBloc = context.read<ProfileBloc>();

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.profileBackground,
      builder: (_) {
        return BlocProvider.value(
          value: profileBloc,
          child: const AddAddressBottomSheet(),
        );
      },
    );
  }

  Future<void> _showAddressDetailsDialog(AddressEntity address) async {
    await showDialog<void>(
      context: context,
      builder: (_) => AddressDetailsDialog(address: address),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bgColor: AppColors.profileBackground,
        title: 'Delivery Addresses',
        style: AppStyles.font16Regular,
        showBackButton: true,
      ),
      backgroundColor: AppColors.profileBackground,
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is AddAddressLoaded) {
            Navigator.pop(context);
            CustomToast.showToast(message: 'Address added successfully');
            context.read<ProfileBloc>().add(GetAddressesEvent());
          } else if (state is AddAddressError) {
            CustomToast.showToast(
              message: state.message,
              state: ToastState.error,
            );
          } else if (state is GetAddressesError) {
            CustomToast.showToast(
              message: state.message,
              state: ToastState.error,
            );
          }
        },
        builder: (context, state) {
          if (state is GetAddressesLoaded) {
            _cachedAddresses = state.addresses;
          }
          final isLoadingAddresses = state is GetAddressesLoading;
          final addresses = _cachedAddresses;

          return SafeArea(
            child: Column(
              children: [
                CustomDivider(),
                Expanded(
                  child: isLoadingAddresses
                      ? const Center(child: CircularProgressIndicator())
                      : addresses.isEmpty
                      ? Center(
                          child: Text(
                            'No delivery addresses yet',
                            style: AppStyles.font16Medium,
                          ),
                        )
                      : ListView.builder(
                          itemCount: addresses.length,
                          itemBuilder: (context, index) {
                            final address = addresses[index];
                            final displayAddress =
                                (address.fullAddress != null &&
                                    address.fullAddress!.trim().isNotEmpty)
                                ? address.fullAddress!
                                : '${address.streetAddress ?? ''}, ${address.city ?? ''}';

                            return AddressItem(
                              address: displayAddress,
                              onTap: () => _showAddressDetailsDialog(address),
                            );
                          },
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: CustomButton(
                    onPressed: () => _showAddAddressBottomSheet(context),
                    text: 'Add New Address',
                    backgroundColor: AppColors.buttonBackground,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
