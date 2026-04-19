import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/shared_widgets/custom_button.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/presentation/widgets/email_field.dart';
import 'package:grocery3/features/profile/presentation/widgets/name_field.dart';
import 'package:grocery3/features/profile/presentation/widgets/phone_field.dart';
import '../widgets/custom_divider.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          bgColor: AppColors.profileBackground,
          showBackButton: true,
          style: AppStyles.font16Medium.copyWith(color: AppColors.black),
          title: 'Personal Details',
        ),
        backgroundColor: AppColors.profileBackground,
        body: Column(
          children: [
            CustomDivider(),
            SizedBox(height: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // name field
                    NameField(),
                    SizedBox(height: 14),
                    // phone field
                    PhoneField(),
                    SizedBox(height: 14),
                    // email field
                    EmailField(),
                    Spacer(),
                    CustomButton(
                      text: 'Save',
                      backgroundColor: AppColors.buttonBackground,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
