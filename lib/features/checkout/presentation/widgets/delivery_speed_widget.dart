import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

enum DeliverySpeed { standard, priority }

class DeliverySpeedWidget extends StatelessWidget {
  final DeliverySpeed selected;
  final ValueChanged<DeliverySpeed> onChanged;

  const DeliverySpeedWidget({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Delivery Speed',
          style: AppStyles.checkoutSectionTitle,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _SpeedChip(
              label: 'Standard',
              icon: Icons.speed_outlined,
              prefix: 'SD',
              isSelected: selected == DeliverySpeed.standard,
              onTap: () => onChanged(DeliverySpeed.standard),
            ),
            const SizedBox(width: 10),
            _SpeedChip(
              label: 'Priority',
              icon: Icons.alarm_outlined,
              prefix: null,
              isSelected: selected == DeliverySpeed.priority,
              onTap: () => onChanged(DeliverySpeed.priority),
            ),
          ],
        ),
      ],
    );
  }
}

class _SpeedChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? prefix;
  final bool isSelected;
  final VoidCallback onTap;

  const _SpeedChip({
    required this.label,
    required this.icon,
    required this.prefix,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? AppColors.checkoutPrimaryText
                : AppColors.checkoutBorder,
            width: isSelected ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.checkoutShadow.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefix != null) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.checkoutPrimaryText
                      : AppColors.checkoutBorder,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  prefix!,
                  style:
                      isSelected
                          ? AppStyles.checkoutMiniBadgeText.copyWith(
                            color: AppColors.white,
                          )
                          : AppStyles.checkoutMiniBadgeText.copyWith(
                            color: AppColors.checkoutSecondaryText,
                          ),
                ),
              ),
              const SizedBox(width: 7),
            ] else ...[
              Icon(icon, size: 16, color: AppColors.checkoutPrimaryText),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style:
                  isSelected
                      ? AppStyles.checkoutPrimaryBodySemiBold
                      : AppStyles.checkoutPrimaryBodySemiBold.copyWith(
                        color: AppColors.checkoutSecondaryText,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
