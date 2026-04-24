import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_text_form_field.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';

class InputFieldWidget extends StatelessWidget {
  final bool isByEmail;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const InputFieldWidget({
    super.key,
    required this.isByEmail,
    required this.emailController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField( 
      controller: isByEmail ? emailController : phoneController,
      hintText: isByEmail ? 'Sarahem@gmail.com' : '+1 234 567 8900',
      prefixIcon: Icon(
        isByEmail ? Icons.email_outlined : Icons.phone_outlined,
        color: AppColors.grey,
        size: 20,
      ),
    );
  }
}
