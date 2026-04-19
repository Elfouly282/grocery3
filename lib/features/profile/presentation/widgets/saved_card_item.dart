import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'card_model.dart';

class SavedCardItem extends StatelessWidget {
  final CardModel card;

  const SavedCardItem({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    // print("card.imagePath: ${card.imagePath}");
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.dividerColor),
      ),
      child: Row(
        children: [
          SizedBox(width: 48, height: 32, child: Image.asset(card.imagePath)),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${card.brand} •••• ${card.lastFour}',
                style: AppStyles.font16Medium.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text('Expires ${card.expiry}', style: AppStyles.font12Regular),
            ],
          ),
        ],
      ),
    );
  }
}
