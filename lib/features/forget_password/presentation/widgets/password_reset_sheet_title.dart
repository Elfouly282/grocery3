import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class PasswordResetSheetTitle extends StatelessWidget {
  const PasswordResetSheetTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Password reset',
      style: AppStyles.font22BoldBlack87,
    );
  }
}
