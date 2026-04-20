
import 'package:flutter/material.dart';

import '../../../../core/utils/theme/app_colors.dart';

class CustomSwitchTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitchTile({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: Colors.white,
      activeTrackColor: AppColors.secondary,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: AppColors.lightGrey,
    );
  }
}