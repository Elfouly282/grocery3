import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/shared_widgets/custom_divider.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/presentation/widgets/help_item.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.profileBackground,
      appBar: CustomAppBar(
        bgColor: AppColors.profileBackground,
        showBackButton: true,
        style: AppStyles.font16Medium.copyWith(color: AppColors.black),
        title: 'Help & Support',
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: const [
          CustomDivider(thickness: 1.5),
          HelpItem(label: '(FAQ)'),
          HelpItem(label: 'Contact Customer Support'),
          HelpItem(label: 'Terms and Conditions'),
          HelpItem(label: 'Privacy Policy'),
          HelpItem(label: 'About Grocery Plus'),
          HelpItem(label: 'App Version: 1.0.5'),
        ],
      ),
    );
  }
}
