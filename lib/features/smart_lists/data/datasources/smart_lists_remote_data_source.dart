import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/api/api_keys.dart';
import 'package:grocery3/core/error/error_model.dart';
import 'package:grocery3/core/error/exception.dart';
import 'package:grocery3/features/smart_lists/data/models/smart_list_model.dart';

abstract class SmartListsRemoteDataSource {
  Future<List<SmartListModel>> getSmartLists();
  Future<SmartListModel> getSmartListDetails(int id);
}

class SmartListsRemoteDataSourceImpl implements SmartListsRemoteDataSource {
  final ApiConsumer api;

  SmartListsRemoteDataSourceImpl({required this.api});

  @override
  Future<List<SmartListModel>> getSmartLists() async {
    try {
      var response = await api.get(EndPoint.smartLists);

      if (response['success'] == true) {
        List<dynamic> data = response[ApiKeys.data];
        return data.map((item) => SmartListModel.fromJson(item)).toList();
      } else {
        throw ServerException(
          errModel: ErrorModel(
            message: response[ApiKeys.message] ?? 'Server Error',
          ),
        );
      }
    } on DioException catch (e) {
      throw ServerException(
        errModel: ErrorModel(
          message: e.response?.data['message'] ?? 'Dio Error',
        ),
      );
    }
  }

  @override
  Future<SmartListModel> getSmartListDetails(int id) async {
    final response = await api.get("${EndPoint.smartLists}/$id");
    return SmartListModel.fromJson(response[ApiKeys.data]);
  }
}
