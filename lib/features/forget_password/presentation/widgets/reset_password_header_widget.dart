import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class ResetPasswordHeaderWidget extends StatelessWidget {
  const ResetPasswordHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Create New Password',
      style: AppStyles.font22BoldBlack87,
    );
  }
}
