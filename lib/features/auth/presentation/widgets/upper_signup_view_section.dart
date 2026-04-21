import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery3/core/constants/app_assets.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class UpperSignUpViewSection extends StatelessWidget {
  const UpperSignUpViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage(Assets.assetsSignupBackground)),
        SizedBox(height: 46.h),
        Image.asset(Assets.assetsLogo, scale: 4),
        SizedBox(height: 32.h),
        Text('Create your Account', style: AppStyles.font16SemiBold),
        Text(
          'Just a few things to get started',
          style: AppStyles.font16Regular,
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
