import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/shared_widgets/custom_divider.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/presentation/widgets/appearance_section.dart';
import 'package:grocery3/features/profile/presentation/widgets/data_management_section.dart';
import 'package:grocery3/features/profile/presentation/widgets/language_section.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.profileBackground,
      appBar: CustomAppBar(
        bgColor: AppColors.profileBackground,
        showBackButton: true,
        style: AppStyles.font16Medium.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
        title: 'Settings',
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDivider(thickness: 1.5),
            LanguageSection(),
            AppearanceSection(),
            DataManagementSection(),
          ],
        ),
      ),
    );
  }
}
