import 'dart:developer';

import 'package:dio/dio.dart';

import '../error/error_model.dart';
import '../helper/cache/cache_helper.dart';
import 'api_keys.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Temporary hardcoded token for testing
    final token = '725|L2N4NA8LoMZUBKTYc0LlvAiNezECO9UEvF0kEKyVdcd436ab'; // CacheHelper().getData(key: ApiKeys.token);

    if (token.isNotEmpty && token != 'guest') {
      options.headers['Authorization'] = 'Bearer ${token.trim()}';
      log('✓ Authorization header added: Bearer ${token.substring(0, 20)}...');
    } else {
      log('⚠ No valid token found');
    }

    handler.next(options);
  }
}
