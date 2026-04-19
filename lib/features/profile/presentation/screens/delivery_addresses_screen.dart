import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/shared_widgets/custom_button.dart';
import 'package:grocery3/core/shared_widgets/custom_divider.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/presentation/widgets/address_item.dart';

class DeliveryAddressesScreen extends StatelessWidget {
  const DeliveryAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bgColor: AppColors.profileBackground,
        title: 'Delivery Addresses',
        style: AppStyles.font16Medium.copyWith(
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
        showBackButton: true,
      ),
      backgroundColor: AppColors.profileBackground,
      body: SafeArea(
        child: Column(
          children: [
            CustomDivider(),
            Expanded(
              child: ListView(
                children: const [AddressItem(address: 'Reykjavík, Iceland')],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: CustomButton(
                onPressed: () {},
                text: 'Add New Address',
                backgroundColor: AppColors.buttonBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
