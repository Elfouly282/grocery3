import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_divider.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class NotificationItem extends StatelessWidget {
  final String label;
  final int index;
  final int length;

  final bool isEnabled;
  final ValueChanged<bool> onChanged;

  const NotificationItem({
    super.key,
    required this.label,
    required this.isEnabled,
    required this.onChanged,
    required this.index,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: AppStyles.font14Regular.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
              ),
              Switch(
                value: isEnabled,
                onChanged: onChanged,
                activeThumbColor: AppColors.white,
                activeTrackColor: AppColors.primary,
                inactiveThumbColor: AppColors.white,
                inactiveTrackColor: AppColors.inactiveTrackColor,
              ),
            ],
          ),
        ),
        !(index == length - 1)
            ? CustomDivider(thickness: 1)
            : const SizedBox.shrink(),
      ],
    );
  }
}
