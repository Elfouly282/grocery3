import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';

class CustomDivider extends StatelessWidget {
  final double? thickness;
  const CustomDivider({super.key, this.thickness});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: AppColors.dividerColor,
      thickness: thickness ?? 0.45,
    );
  }
}
