import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'tab_item_widget.dart';

class ToggleTabWidget extends StatelessWidget {
  final bool isByEmail;
  final ValueChanged<bool> onToggle;

  const ToggleTabWidget({
    super.key,
    required this.isByEmail,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          TabItemWidget(
            label: 'By Email',
            isSelected: isByEmail,
            onTap: () => onToggle(true),
          ),
          TabItemWidget(
            label: 'By Phone number',
            isSelected: !isByEmail,
            onTap: () => onToggle(false),
          ),
        ],
      ),
    );
  }
}
