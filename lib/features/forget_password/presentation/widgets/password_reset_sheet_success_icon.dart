import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';

class PasswordResetSheetSuccessIcon extends StatelessWidget {
  const PasswordResetSheetSuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border, width: 1.5),
      ),
      child: const Center(
        child: Icon(
          Icons.check,
          color: AppColors.success,
          size: 44,
          weight: 700,
        ),
      ),
    );
  }
}
