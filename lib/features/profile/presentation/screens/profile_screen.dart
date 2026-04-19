import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/presentation/screens/delivery_addresses_screen.dart';
import 'package:grocery3/features/profile/presentation/screens/help_support_screen.dart';
import 'package:grocery3/features/profile/presentation/screens/notifications_screen.dart';
import 'package:grocery3/features/profile/presentation/screens/payment_method_screen.dart';
import 'package:grocery3/features/profile/presentation/screens/personl_details_screen.dart';
import 'package:grocery3/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:grocery3/features/profile/presentation/widgets/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bgColor: AppColors.profileBackground,
        showBackButton: true,
        style: AppStyles.font16Medium.copyWith(color: AppColors.black),
        title: 'My Profile',
      ),
      backgroundColor: AppColors.profileBackground,
      body: SafeArea(
        child: Column(
          children: [
            Divider(color: AppColors.dividerColor, thickness: 0.45, height: 1),
            Expanded(
              child: ListView(
                children: [
                  ProfileAvatar(),
                  SizedBox(height: 16),
                  ProfileMenuItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonalDetailsScreen(),
                        ),
                      );
                    },
                    imagePath: "assets/images/user_icon.png",
                    label: 'Personal details',
                  ),
                  ProfileMenuItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeliveryAddressesScreen(),
                        ),
                      );
                    },
                    imagePath: "assets/images/map_point_icon.png",
                    label: 'Delivery addresses',
                  ),
                  ProfileMenuItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsScreen(),
                        ),
                      );
                    },
                    imagePath: "assets/images/notifications_icon.png",
                    label: 'Notifications Allowed',
                  ),
                  ProfileMenuItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentMethodsScreen(),
                        ),
                      );
                    },
                    imagePath: "assets/images/payment_icon.png",
                    label: 'Payment methods',
                  ),
                  ProfileMenuItem(
                    imagePath: "assets/images/settings_icon.png",
                    label: 'Settings',
                  ),
                  ProfileMenuItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpSupportScreen(),
                        ),
                      );
                    },
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
