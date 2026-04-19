import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      color: AppColors.dividerColor,
      thickness: 0.45,
    );
  }
}
