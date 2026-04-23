import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/notification/domain/Entity/notification_Entity.dart';

import '../Cubit/notification_cubit.dart';
import '../Cubit/notification_state.dart';
import 'Custom_BackgroundContainer.dart';
import 'SettingsSwitchTile.dart';
import 'custom_Divider.dart';
import 'notification_View_Body_BlocBuilder.dart';

class OrderDeliveryNotificationSection extends StatelessWidget {
  const OrderDeliveryNotificationSection({super.key,required this.notificationEntity});
final NotificationEntity notificationEntity;
  @override
  Widget build(BuildContext context) {
        return Custom_BackgroundContainer(
          child: Column(
            children: notificationEntity.settings.entries.map((e) {
              return Column(
                children: [
                  SettingsSwitchTile(
                    settingTitle: _formatKey(e.key),
                    value: e.value,
                    onChanged: (value) {
                      context.read<NotificationCubit>().updateSetting(
                        groupKey: notificationEntity.key,
                        settingKey: e.key,
                        value: value,
                      );
                    },
                  ),
                 const  Custom_Divider(),
                ],
              );
            }).toList(),
          ),
        );
      }

  }

String _formatKey(String key) {
  return key.replaceAll('_', ' ');
}