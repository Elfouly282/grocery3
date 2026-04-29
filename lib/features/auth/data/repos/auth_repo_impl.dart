import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/error/exception.dart';
import 'package:grocery3/features/auth/data/models/user_model.dart';
import 'package:grocery3/features/auth/domin/repos/auth_repo.dart';
import 'package:grocery3/features/auth/domin/user_entity.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiConsumer apiConsumer;
  AuthRepoImpl(this.apiConsumer);
  @override
  Future<Either<String, UserEntity>> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      var response = await apiConsumer.post(
        'https://grocery.newcinderella.online/api/auth/register',
        data: FormData.fromMap({
          'username': name,
          'email': email,
          'phone': phone,
          'password': password,
          'password_confirmation': password,
          'agree_terms': '1',
        }),
      );
      dynamic data = response["data"];
      dynamic user = UserModel.fromJson({
        ...data["user"],
        "token": data["token"],
      });

      return right(UserEntity.fromModel(user));
    } on ServerException catch (e) {
      return Left(e.errModel.message.toString());
    }
  }
}
