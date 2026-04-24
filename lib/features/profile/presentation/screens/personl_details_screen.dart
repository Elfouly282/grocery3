import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/shared_widgets/custom_button.dart';
import 'package:grocery3/core/shared_widgets/custom_divider.dart';
import 'package:grocery3/core/utils/custom_toast.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/domain/entities/update_profile_entity.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_event.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_state.dart';
import 'package:grocery3/features/profile/presentation/widgets/email_field.dart';
import 'package:grocery3/features/profile/presentation/widgets/name_field.dart';
import 'package:grocery3/features/profile/presentation/widgets/phone_field.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _countryCode;

  @override
  void initState() {
    super.initState();
    final state = context.read<ProfileBloc>().state;
    if (state is GetProfileLoaded) {
      _nameController.text = state.user.username;
      _phoneController.text = state.user.phone;
      _emailController.text = state.user.email;
      _countryCode = state.user.countryCode;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    final fullName = _nameController.text.trim();

    final parts = fullName.split(' ');

    final firstName = parts.isNotEmpty ? parts.first : '';
    final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';
    final updateEntity = UpdateProfileEntity(
      firstName: firstName,
      lastName: lastName,
      preferredLanguages: ["en"],
      userName: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
      email: _emailController.text.trim(),
      countryCode: _countryCode!,
    );
    context.read<ProfileBloc>().add(UpdateProfileEvent(params: updateEntity));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          bgColor: AppColors.profileBackground,
          showBackButton: true,
          style: AppStyles.font16Medium.copyWith(color: AppColors.black),
          title: 'Personal Details',
        ),
        backgroundColor: AppColors.profileBackground,
        body: Column(
          children: [
            CustomDivider(),
            SizedBox(height: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // name field
                    NameField(controller: _nameController),
                    SizedBox(height: 14),
                    // phone field
                    PhoneField(
                      controller: _phoneController,
                      onCountryCodeChanged: (code) {
                        _countryCode = code;
                      },
                    ),
                    SizedBox(height: 14),
                    // email field
                    EmailField(controller: _emailController),
                    Spacer(),
                    BlocConsumer<ProfileBloc, ProfileState>(
                      listener: (context, state) {
                        if (state is UpdateProfileLoaded) {
                          CustomToast.showToast(
                            message: "Profile Updated Successfully",
                          );
                        } else if (state is UpdateProfileError) {
                          CustomToast.showToast(
                            message: state.message,
                            state: ToastState.error,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is UpdateProfileLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return CustomButton(
                          text: 'Save',
                          backgroundColor: AppColors.buttonBackground,
                          onPressed: _saveProfile,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
