import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:grocery3/core/helper/cache/cache_helper.dart';

import '../error/exception.dart';
import 'api_consumer.dart';
import 'api_interceptor.dart';
import 'api_keys.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.options.headers = {'Accept': 'application/json'};
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
    Map<String, dynamic>? headers,

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

      rethrow; // 🔥 مهم جدًا بدل ما ترجع null
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
        options:
            headers != null
                ? Options(
                  headers: {
                    "Authorization":
                        "Bearer ${CacheHelper().getData(key: ApiKeys.token)}",
                  },
                )
                : null,
      );

      // هنا بنتأكد لو البيانات جت نص بنحولها لـ JSON
      if (response.data is String) {
        return jsonDecode(response.data);
      }
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
      debugPrint('post error: ${e.toString()}');
      rethrow; // 🔥 مهم جدًا بدل ما ترجع null
    }
  }

  @override
  Future patch(
    String path, {
    Map<String, dynamic>? headers,

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
      return response;
    } on DioException catch (e) {
      debugPrint('post error: ${e.toString()}');

      rethrow; // 🔥 مهم جدًا بدل ما ترجع null
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? headers,

    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${CacheHelper().getData(key: ApiKeys.token)}",
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
      debugPrint('post error: ${e.toString()}');
      rethrow; // 🔥 مهم جدًا بدل ما ترجع null
    }
  }

  @override
  Future put(
    String path, {
    Map<String, dynamic>? headers,

    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        // data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
      debugPrint('post error: ${e.toString()}');
      rethrow; // 🔥 مهم جدًا بدل ما ترجع null
    }
  }
}
