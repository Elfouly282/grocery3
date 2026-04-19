import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/presentation/widgets/notification_model.dart';
import 'notification_item.dart';

class NotificationSection extends StatelessWidget {
  final String title;
  final List<NotificationModel> items;
  final Function(int, bool) onToggle;

  const NotificationSection({
    super.key,
    required this.title,
    required this.items,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 10),
          child: Text(
            title,
            style: AppStyles.font16Medium.copyWith(color: AppColors.black),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffF8F8F8),

            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: List.generate(
              items.length,
              (index) => NotificationItem(
                index: index,
                length: items.length,
                label: items[index].label,
                isEnabled: items[index].isEnabled,
                onChanged: (value) => onToggle(index, value),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
