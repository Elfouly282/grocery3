import 'package:dartz/dartz.dart';
import 'package:grocery3/Features/notification/domain/Entity/notification_Entity.dart';
import 'package:grocery3/core/error/exception.dart';

abstract class NotificationRepo{
  Future<Either<ServerException,List<NotificationEntity>>>getSettings();
  Future<Either<ServerException,void>> updateSettings({
    required String groupKey,
    required String settingKey,
    required bool value,
  });
}