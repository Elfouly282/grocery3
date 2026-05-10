import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../error/exception.dart';
import '../helper/cache/cache_helper.dart';
import 'api_consumer.dart';
import 'api_interceptor.dart';
import 'api_keys.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.options.headers = {
      'Accept': 'application/json',
    };
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('post error: ${e.toString()}');

      throw e; // 🔥 مهم جدًا بدل ما ترجع null
    }
  }

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('post error: ${e.toString()}');

      throw e; // 🔥 مهم جدًا بدل ما ترجع null
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint('post error: ${e.toString()}');

      throw e; // 🔥 مهم جدًا بدل ما ترجع null
    }
  }

  @override
  Future<dynamic> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
    Options? options,
  }) async {
    try {
      final response = await dio.post(
        path,
        data:
            isFromData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
        options: options,
      );

      return response.data;
    } on DioException catch (e) {
      debugPrint('post error: ${e.toString()}');

      throw e; // 🔥 مهم جدًا بدل ما ترجع null
    }
  }
}
