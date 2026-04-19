import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/shared_widgets/custom_button.dart';
import 'package:grocery3/core/shared_widgets/custom_divider.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/presentation/widgets/add_new_card.dart';
import 'package:grocery3/features/profile/presentation/widgets/card_model.dart';
import 'package:grocery3/features/profile/presentation/widgets/saved_card_item.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  static const List<CardModel> _cards = [
    CardModel(
      imagePath: 'assets/images/visa_icon.png',
      brand: 'Visa',
      lastFour: '4242',
      expiry: '12/25',
    ),
    CardModel(
      imagePath: 'assets/images/master_card_icon.png',
      brand: 'Mastercard',
      lastFour: '8888',
      expiry: '08/26',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.profileBackground,
        appBar: CustomAppBar(
          bgColor: AppColors.profileBackground,
          title: 'Payment methods',
          showBackButton: true,
          style: AppStyles.font16Medium.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.primary,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDivider(thickness: 1.5),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const Text('Saved Cards', style: AppStyles.font18Bold),
                  const SizedBox(height: 14),
                  ..._cards.map((card) => SavedCardItem(card: card)),
                  const SizedBox(height: 4),
                  const AddNewCard(),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomButton(
                backgroundColor: AppColors.primary,
                text: 'Save',
                onPressed: () {
                  // Handle save action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
