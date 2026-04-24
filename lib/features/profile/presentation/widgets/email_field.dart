import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_text_form_field.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';

class EmailField extends StatelessWidget {
  final TextEditingController? controller;
  const EmailField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: 'keroles @gmail.com',
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icon(Icons.email_outlined, color: AppColors.iconColor),
    );
  }
}
