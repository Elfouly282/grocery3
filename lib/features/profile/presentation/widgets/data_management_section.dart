import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/features/profile/presentation/widgets/section_title.dart';
import 'data_action_card.dart';

class DataManagementSection extends StatelessWidget {
  const DataManagementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Data Management'),
        DataActionCard(
          title: 'Download Your Data',
          subtitle: 'Get a copy of your account information',
          backgroundColor: AppColors.dataActionBackground,
          titleColor: AppColors.black,
          subtitleColor: AppColors.grey,
          onTap: () {},
        ),
        DataActionCard(
          title: 'Delete Account',
          subtitle: 'Permanently delete your account and data',
          backgroundColor: AppColors.dataActionBackgroundLight,
          titleColor: AppColors.error,
          subtitleColor: AppColors.error,
          icon: Icons.delete_outline,
          onTap: () {},
        ),
      ],
    );
  }
}
