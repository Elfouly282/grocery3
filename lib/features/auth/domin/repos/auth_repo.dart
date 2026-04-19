import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/exception.dart';
import 'package:grocery3/features/auth/domin/user_entity.dart';

abstract class AuthRepo {
  Future<Either<ServerException, UserEntity>> signUp({
    required String email,
    required String password,
    required String name,
  });

  // Future<void> login({
  //   required String email,
  //   required String password,
  // });
}