import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class AddNewCard extends StatelessWidget {
  const AddNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.dividerColor),
        ),
        child: Row(
          children: [
            Icon(Icons.add, size: 20, color: AppColors.primary),
            SizedBox(width: 12),
            Text(
              'Add New Card',
              style: AppStyles.font16Medium.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
