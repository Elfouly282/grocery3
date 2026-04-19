import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Column(
        children: [
          Container(
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.profileMenuItemBackground,
            ),
            child: Image.asset("assets/images/user_icon.png"),
          ),
          const SizedBox(height: 9),
          Text(
            'Edit Profile Photo',
            style: AppStyles.font16Medium.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
