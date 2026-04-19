import 'package:dio/dio.dart';

import 'error_model.dart';

class ServerException implements Exception {
  final ErrorModel errModel;

  ServerException({required this.errModel});

  @override
  String toString() {
    return errModel.message ?? "Server Error";
  }
}

void handleDioExceptions(DioException e) {
  // دالة مساعدة لتحويل البيانات بأمان
  ErrorModel getErrorModel(dynamic data) {
    if (data is Map<String, dynamic>) {
      return ErrorModel.fromJson(data);
    } else if (data is String && (data.contains('<!DOCTYPE html>') || data.contains('<html>'))) {
      return ErrorModel(message: "Server Error: Page not found (404)");
    } else {
      return ErrorModel(message: data?.toString() ?? "Unknown error occurred");
    }
  }

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
    case DioExceptionType.connectionError:
    case DioExceptionType.unknown:
      throw ServerException(errModel: getErrorModel(e.response?.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
        case 401:
        case 403:
        case 404:
        case 409:
        case 422:
        case 504:
          throw ServerException(errModel: getErrorModel(e.response?.data));
        default:
          throw ServerException(
            errModel: ErrorModel(message: "Server returned error: ${e.response?.statusCode}")
          );
      }
  }
}
