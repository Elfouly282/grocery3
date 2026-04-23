import 'dart:developer';

import 'package:dio/dio.dart';

import '../error/error_model.dart';
import '../helper/cache/cache_helper.dart';
import 'api_keys.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
    'Bearer 956|1GoicHGCeqjXKKre56A76ehd7AZAucFS7a5pzVV9ed1fe285';

    handler.next(options);
  }
}