import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grocery3/Features/notification/data/model/notificationMapper.dart';
import 'package:grocery3/Features/notification/domain/Entity/notification_Entity.dart';
import 'package:grocery3/Features/notification/domain/repo/NotificationRepo.dart';
import 'package:grocery3/core/api/api_keys.dart';
import 'package:grocery3/core/error/error_model.dart';
import 'package:grocery3/core/error/exception.dart';

import '../../../../core/api/api_consumer.dart';
import '../model/notificationResponseModel.dart';

class NotificationRepoImpl extends NotificationRepo {
  final ApiConsumer api;

  NotificationRepoImpl(this.api);

  @override
  Future<
      Either<ServerException, List<NotificationEntity>>> getSettings() async {
    try {
      final response = await api.get(EndPoint.notificationSettings);

      final model = NotificationResponseModel.fromJson(response);

      final result = model.data.entries
          .map((e) => e.value.toEntity(e.key))
          .toList();

      return Right(result);
    } on ServerException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerException(
          errModel: ErrorModel(message: e.toString()),
        ),
      );
    }
  }

  @override
  Future<Either<ServerException, void>> updateSettings({
    required String groupKey,
    required String settingKey,
    required bool value,
  }) async {
    try {
      await api.patch(
        EndPoint.notificationSettings,
        data: {
          settingKey: value ? 1 : 0,
        },

      );

      return const Right(null);
    } catch (e) {
      return Left(
        ServerException(errModel: ErrorModel(message: e.toString())),
      );
    }
  }
  }



