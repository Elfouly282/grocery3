// data/models/user_model.dart

import 'package:grocery3/features/login/domain/entities/user_entity.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.username,
    required super.email,
    required super.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );
  }
}

class AuthResultModel extends AuthResult {
  AuthResultModel({required super.user, required super.token});

  factory AuthResultModel.fromJson(Map<String, dynamic> json) {
    // Accessing 'data' directly from the unwrapped Map
    final data = json['data'] as Map<String, dynamic>;

    return AuthResultModel(
      user: UserModel.fromJson(data['user'] as Map<String, dynamic>),
      token: data['token'] as String,
    );
  }
}
