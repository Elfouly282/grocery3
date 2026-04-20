class NotificationEntity {
  final String key;
  final String title;
  final bool enabled;
  final Map<String, bool> settings;

  NotificationEntity({
    required this.key,
    required this.title,
    required this.enabled,
    required this.settings,
  });

}