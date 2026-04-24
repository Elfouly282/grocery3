import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class SubtitleTextWidget extends StatelessWidget {
  final bool isByEmail;

  const SubtitleTextWidget({super.key, required this.isByEmail});

  @override
  Widget build(BuildContext context) {
    return Text(
      isByEmail
          ? 'Enter the email associated with your account'
          : 'Enter the phone number associated with your account',
      style: AppStyles.font14RegularGrey,
    );
  }
}
