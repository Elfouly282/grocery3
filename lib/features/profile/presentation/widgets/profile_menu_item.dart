import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/presentation/widgets/custom_divider.dart';

class ProfileMenuItem extends StatelessWidget {
  final String label;
  final bool isLogout;
  final String imagePath;

  const ProfileMenuItem({
    super.key,
    required this.label,
    this.isLogout = false,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 8,
          ),
          leading: Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.profileMenuItemBackground,
              // borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(imagePath),
          ),
          title: Text(
            label,
            style: AppStyles.font16Medium.copyWith(
              color: isLogout ? AppColors.logoutColor : AppColors.primary,
            ),
          ),
          trailing: isLogout
              ? null
              : const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: AppColors.iconColor,
                ),
        ),
        !isLogout ? CustomDivider() : SizedBox.shrink(),
      ],
    );
  }
}
