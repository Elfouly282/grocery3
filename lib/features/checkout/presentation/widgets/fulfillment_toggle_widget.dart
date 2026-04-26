import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

enum FulfillmentMode { delivery, pickup }

class FulfillmentToggleWidget extends StatelessWidget {
  final FulfillmentMode selected;
  final ValueChanged<FulfillmentMode> onChanged;

  const FulfillmentToggleWidget({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.checkoutBorder, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.checkoutShadow.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _Tab(
            label: 'Delivery',
            icon: Icons.delivery_dining_outlined,
            isSelected: selected == FulfillmentMode.delivery,
            onTap: () => onChanged(FulfillmentMode.delivery),
          ),
          _Tab(
            label: 'Pick Up',
            icon: Icons.directions_car_outlined,
            isSelected: selected == FulfillmentMode.pickup,
            onTap: () => onChanged(FulfillmentMode.pickup),
          ),
        ],
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _Tab({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 11),
          decoration: BoxDecoration(
            color:
                isSelected
                    ? AppColors.checkoutPrimaryText
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color:
                    isSelected
                        ? AppColors.white
                        : AppColors.checkoutSecondaryText,
              ),
              const SizedBox(width: 7),
              Text(
                label,
                style:
                    isSelected
                        ? AppStyles.checkoutPrimaryBodySemiBold.copyWith(
                          color: AppColors.white,
                        )
                        : AppStyles.checkoutPrimaryBodySemiBold.copyWith(
                          color: AppColors.checkoutSecondaryText,
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
