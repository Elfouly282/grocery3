class NotificationModel {
  final String category;
  final bool enabled;
  final Map<String, dynamic> settings;

  NotificationModel({
    required this.category,
    required this.enabled,
    required this.settings,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      category: json['category'],
      enabled: json['enabled'],
      settings: json['settings'] ?? {},
    );
  }
}