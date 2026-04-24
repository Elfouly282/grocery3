import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class OtpHeaderWidget extends StatelessWidget {
  const OtpHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Enter Digits Code', style: AppStyles.font22Bold),
        const SizedBox(height: 6),
        Text(
          'Enter the digits code that you received',
          style: AppStyles.font14RegularGrey,
        ),
      ],
    );
  }
}
