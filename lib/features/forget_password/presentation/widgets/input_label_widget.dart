import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class InputLabelWidget extends StatelessWidget {
  final bool isByEmail;

  const InputLabelWidget({super.key, required this.isByEmail});

  @override
  Widget build(BuildContext context) {
    return Text(
      isByEmail ? 'Email' : 'Phone number',
      style: AppStyles.font14MediumBlack87,
    );
  }
}
