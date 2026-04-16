import 'package:grocery3/core/api/api_keys.dart';

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {ApiKeys.email: email, ApiKeys.password: password};
  }
}
