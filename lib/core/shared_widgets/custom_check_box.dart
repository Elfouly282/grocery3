import 'package:flutter/material.dart';
import '../utils/theme/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String? label;

  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        if (label != null)
          Text(label!, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}