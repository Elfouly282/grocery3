import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';

class PasswordResetSheetDragHandle extends StatelessWidget {
  const PasswordResetSheetDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
