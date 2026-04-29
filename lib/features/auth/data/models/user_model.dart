import 'package:grocery3/core/api/api_keys.dart';
import 'package:grocery3/core/helper/cache/cache_helper.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    CacheHelper().setData(key: ApiKeys.token, value: json["token"]);
    return UserModel(
      id: json["id"],
      name: json["username"],
      phone: json["phone"],
      email: json["email"],
      token: json["token"],
    );
  }
}
