import 'dart:developer';

import 'package:dio/dio.dart';

import '../error/error_model.dart';
import '../helper/cache/cache_helper.dart';
import 'api_keys.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
    'Bearer 698|n6wAs00NxUVbPOvh8ewvHa0gvNM4KyjMhoZl8ZEA4cbea1d3';

    handler.next(options);
  }
}