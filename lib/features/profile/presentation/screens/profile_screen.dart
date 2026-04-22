import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_event.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_state.dart';
import 'package:grocery3/features/profile/presentation/screens/delivery_addresses_screen.dart';
import 'package:grocery3/features/profile/presentation/screens/personl_details_screen.dart';
import 'package:grocery3/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:grocery3/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:grocery3/injection_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          bgColor: AppColors.profileBackground,
          showBackButton: true,
          style: AppStyles.font16Medium.copyWith(color: AppColors.black),
          title: 'My Profile',
        ),
        backgroundColor: AppColors.profileBackground,
        body: BlocProvider(
          create: (context) => sl<ProfileBloc>()..add(GetProfileEvent()),
          child: ProfileBody(),
        ),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: AppColors.dividerColor, thickness: 0.45, height: 1),
        Expanded(
          child: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {},
            builder: (context, state) => ListView(
              children: [
                ProfileAvatar(imgURL: "assets/images/user_avatar.png"),
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
                  onTap: () {},
                  imagePath: "assets/images/notifications_icon.png",
                  label: 'Notifications Allowed',
                ),
                ProfileMenuItem(
                  onTap: () {},
                  imagePath: "assets/images/payment_icon.png",
                  label: 'Payment methods',
                ),
                ProfileMenuItem(
                  imagePath: "assets/images/settings_icon.png",
                  label: 'Settings',
                ),
                ProfileMenuItem(
                  onTap: () {},
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
        ),
      ],
    );
  }
}
