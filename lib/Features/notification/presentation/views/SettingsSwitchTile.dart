
import 'package:flutter/material.dart';

import '../../../../core/utils/theme/app_styles.dart';
import 'CustomSwitchTile.dart';
import 'notification_View_Body_BlocBuilder.dart';

class SettingsSwitchTile extends StatelessWidget {
  final String settingTitle;
  final bool value;
  final Function(bool) onChanged;

  const SettingsSwitchTile({
    super.key,
    required this.settingTitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(settingTitle, style: AppStyles.font14Medium),
        const Spacer(),
        CustomSwitchTile(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
