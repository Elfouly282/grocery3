import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:grocery3/features/profile/presentation/widgets/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: true,
        style: AppStyles.font16Medium.copyWith(color: AppColors.black),
        title: 'My Profile',
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Divider(color: AppColors.dividerColor, thickness: 0.45, height: 1),
            Expanded(
              child: ListView(
                children: const [
                  ProfileAvatar(),
                  SizedBox(height: 16),
                  ProfileMenuItem(
                    imagePath: "assets/images/user_icon.png",
                    label: 'Personal details',
                  ),
                  ProfileMenuItem(
                    imagePath: "assets/images/map_point_icon.png",
                    label: 'Delivery addresses',
                  ),
                  ProfileMenuItem(
                    imagePath: "assets/images/notifications_icon.png",
                    label: 'Notifications Allowed',
                  ),
                  ProfileMenuItem(
                    imagePath: "assets/images/payment_icon.png",
                    label: 'Payment methods',
                  ),
                  ProfileMenuItem(
                    imagePath: "assets/images/settings_icon.png",
                    label: 'Settings',
                  ),
                  ProfileMenuItem(
                    imagePath: "assets/images/help_icon.png",
                    label: 'Help & Support',
                  ),
                  ProfileMenuItem(
                    imagePath: "assets/images/log_out_icon.png",
                    label: 'Logout',
                    isLogout: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
