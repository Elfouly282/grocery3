import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_text_form_field.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class PasswordFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggleObscure;
  final bool hasError;

  const PasswordFieldWidget({
    super.key,
    required this.label,
    required this.controller,
    required this.obscureText,
    required this.onToggleObscure,
    this.hasError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(),
        const SizedBox(height: 8),
        _buildTextField(),
        if (hasError) _buildErrorText(),
      ],
    );
  }

  Widget _buildLabel() {
    return Text(
      label,
      style: AppStyles.font14MediumBlack87,
    );
  }

  Widget _buildTextField() {
    return CustomTextFormField(
      controller: controller,
 
      isObscureText: obscureText,
      hintText: 'Enter your password',
      prefixIcon: Icon(Icons.lock_outlined),
      suffixIcon: IconButton(onPressed: onToggleObscure, icon: Icon(obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined)),
    );
  }

  Widget _buildErrorText() {
    return const Padding(
      padding: EdgeInsets.only(top: 6, left: 4),
      child: Text(
        'Passwords do not match',
        style: AppStyles.font12RegularRedAccent,
      ),
    );
  }
}
