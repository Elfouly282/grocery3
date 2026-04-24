import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_button.dart';
import 'reset_password_header_widget.dart';
import 'password_field_widget.dart';
import 'password_validation_widget.dart';

class ResetPasswordBody extends StatelessWidget {
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final bool obscureNew;
  final bool obscureConfirm;
  final bool hasMinLength;
  final bool hasNumber;
  final bool passwordsMatch;
  final VoidCallback onToggleNew;
  final VoidCallback onToggleConfirm;
  final VoidCallback onReset;
  final bool isLoading;

  const ResetPasswordBody({
    super.key,
    required this.newPasswordController,
    required this.confirmPasswordController,
    required this.obscureNew,
    required this.obscureConfirm,
    required this.hasMinLength,
    required this.hasNumber,
    required this.passwordsMatch,
    required this.onToggleNew,
    required this.onToggleConfirm,
    required this.onReset,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ResetPasswordHeaderWidget(),
          const SizedBox(height: 28),
          PasswordFieldWidget(

            label: 'New Password',
            controller: newPasswordController,
            obscureText: obscureNew,
            onToggleObscure: onToggleNew,
          ),
          const SizedBox(height: 16),
          PasswordFieldWidget(
            label: 'Confirm Password',
            controller: confirmPasswordController,
            obscureText: obscureConfirm,
            onToggleObscure: onToggleConfirm,
            hasError: confirmPasswordController.text.isNotEmpty && !passwordsMatch,
          ),
          const SizedBox(height: 16),
          PasswordValidationWidget(
            
            hasMinLength: hasMinLength,
            hasNumber: hasNumber,
          ),
          const SizedBox(height: 28),
          CustomButton(
            text: 'Reset', 
            isLoading: isLoading,
            onPressed: onReset,
          ),
        ],
      ),
    );
  }
}
