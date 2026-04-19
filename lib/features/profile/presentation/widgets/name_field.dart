import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_text_form_field.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';

class NameField extends StatelessWidget {
  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Keroles Hany',
      keyboardType: TextInputType.name,
      prefixIcon: Icon(Icons.person_outline, color: AppColors.iconColor),
    );
  }
}
