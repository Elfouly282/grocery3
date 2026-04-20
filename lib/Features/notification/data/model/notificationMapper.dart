import '../../domain/Entity/notification_Entity.dart';
import 'notificationModel.dart';

extension NotificationMapper on NotificationModel {
  NotificationEntity toEntity(String key) {
    return NotificationEntity(
      key: key,
      title: category,
      enabled: enabled,
      settings: settings.map(
            (k, v) => MapEntry(k, v ?? false),
      ),
    );
  }
}