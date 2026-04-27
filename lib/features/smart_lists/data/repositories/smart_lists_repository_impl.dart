import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:grocery3/core/error/error_model.dart';
import 'package:grocery3/features/smart_lists/domain/entities/smart_list.dart';
import 'package:grocery3/features/smart_lists/domain/repositories/smart_lists_repository.dart';
import 'package:grocery3/features/smart_lists/data/datasources/smart_lists_remote_data_source.dart';

import '../../../../core/error/failures.dart';

class SmartListsRepositoryImpl implements SmartListsRepository {
  final SmartListsRemoteDataSource remoteDataSource;

  SmartListsRepositoryImpl({required this.remoteDataSource});

  @override
  @override
  Future<Either<ServerException, List<SmartListEntity>>> getSmartLists() async {
    try {
      var lists = await remoteDataSource.getSmartLists();
      return right(lists);
    } catch (e) {
      debugPrint('error  in  smart list impl  : ${e.toString()}');
      if (e is DioException) {
        return left(
          ServerException(
            e.response?.data['message'] ?? 'Server Error',
            errModel: ErrorModel(
              message: e.response?.data['message'] ?? 'Server Error',
            ),
          ),
        );
      }
      return left(
        ServerException(
          e.toString(),
          errModel: ErrorModel(message: e.toString()),
        ),
      );
    }
  }

  @override
  @override
  Future<Either<ServerException, SmartListEntity>> getSmartListDetails(
    int id,
  ) async {
    try {
      var list = await remoteDataSource.getSmartListDetails(id);
      return right(list);
    } catch (e) {
      debugPrint('error  in  smart list details impl  : ${e.toString()}');
      if (e is DioException) {
        return left(
          ServerException(
            e.response?.data['message'] ?? 'Server Error',
            errModel: ErrorModel(
              message: e.response?.data['message'] ?? 'Server Error',
            ),
          ),
        );
      }
      return left(
        ServerException(
          e.toString(),
          errModel: ErrorModel(message: e.toString()),
        ),
      );
    }
  }
}
