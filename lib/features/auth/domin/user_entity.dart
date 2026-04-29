import 'package:grocery3/features/auth/data/models/user_model.dart';

class UserEntity {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String token;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.token,
  });

  factory UserEntity.fromModel(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      phone: model.phone,
      token: model.token,
    );
  }
  UserModel toModel() {
    return UserModel(
      id: id,
      name: name,
      email: email,
      phone: phone,
      token: token,
    );
  }
}
