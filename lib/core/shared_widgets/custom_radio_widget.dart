import 'package:flutter/material.dart';
import '../utils/theme/app_colors.dart';
import '../utils/theme/app_styles.dart';

class CustomRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String label;
  final ValueChanged<T?> onChanged;
  final Color? activeColor;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<T>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: activeColor ?? AppColors.primary,
              // تقليل المساحة المحيطة بالدائرة ليكون التصميم متناسقاً
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppStyles.font14Regular.copyWith(
                color: value == groupValue ? AppColors.black : AppColors.grey,
                fontWeight: value == groupValue ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}