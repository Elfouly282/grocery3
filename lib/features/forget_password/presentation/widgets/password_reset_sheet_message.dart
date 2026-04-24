import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class PasswordResetSheetMessage extends StatelessWidget {
  const PasswordResetSheetMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'You have successfully reset your password.\nPlease use your new password when logging in',
      textAlign: TextAlign.center,
      style: AppStyles.font14RegularGreyHeight150,
    );
  }
}
