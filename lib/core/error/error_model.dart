
import '../api/api_keys.dart';

class ErrorModel {
  int? code;
  String? message;
  String? errors;
  String? data;

  ErrorModel({this.code, this.message, this.errors, this.data});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      code: jsonData[ApiKeys.statusCode],
      message: jsonData[ApiKeys.message],
      errors: jsonData[ApiKeys.errors],
      data: jsonData[ApiKeys.data],
    );
  }
}
