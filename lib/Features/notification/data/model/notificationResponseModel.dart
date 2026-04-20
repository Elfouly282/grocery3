import 'notificationModel.dart';

class NotificationResponseModel {
  final Map<String, NotificationModel> data;

  NotificationResponseModel({required this.data});

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    final Map<String, NotificationModel> parsedData = {};

    json['data'].forEach((key, value) {
      parsedData[key] = NotificationModel.fromJson(value);
    });

    return NotificationResponseModel(data: parsedData);
  }
}