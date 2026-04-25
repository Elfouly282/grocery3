import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/shared_widgets/custom_button.dart';
import 'package:grocery3/core/shared_widgets/custom_text_form_field.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/domain/entities/add_address_params_entity.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_event.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_state.dart';

class AddAddressBottomSheet extends StatefulWidget {
  const AddAddressBottomSheet({super.key});

  @override
  State<AddAddressBottomSheet> createState() => _AddAddressBottomSheetState();
}

class _AddAddressBottomSheetState extends State<AddAddressBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetAddressController = TextEditingController();
  final _cityController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _streetAddressController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Add New Address', style: AppStyles.font16Medium),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Full Name / Full Address',
                controller: _fullNameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Full name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                hintText: 'Phone',
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Phone is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                hintText: 'Street Address',
                controller: _streetAddressController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Street address is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                hintText: 'City',
                controller: _cityController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'City is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return CustomButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<ProfileBloc>().add(
                          AddAddressEvent(
                            params: AddAddressParamsEntity(
                              fullName: _fullNameController.text.trim(),
                              phone: _phoneController.text.trim(),
                              streetAddress: _streetAddressController.text.trim(),
                              city: _cityController.text.trim(),
                            ),
                          ),
                        );
                      }
                    },
                    text: 'Save Address',
                    isLoading: state is AddAddressLoading,
                    backgroundColor: AppColors.buttonBackground,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
