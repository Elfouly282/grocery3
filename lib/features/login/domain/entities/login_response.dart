import 'package:grocery3/core/api/api_keys.dart';

import 'user.dart';

class LoginResponse {
  final bool success;
  final String message;
  final LoginData data;

  LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json[ApiKeys.succeess],
      message: json[ApiKeys.message],
      data: LoginData.fromJson(json[ApiKeys.data]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.succeess: success,
      ApiKeys.message: message,
      ApiKeys.data: data.toJson(),
    };
  }
}

class LoginData {
  final User user;
  final String token;

  LoginData({required this.user, required this.token});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      user: User.fromJson(json[ApiKeys.user]),
      token: json[ApiKeys.token],
    );
  }

  Map<String, dynamic> toJson() {
    return {ApiKeys.user: user.toJson(), ApiKeys.token: token};
  }
}
