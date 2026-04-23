import 'package:dartz/dartz.dart';
import 'package:grocery3/features/auth/domin/user_entity.dart';

abstract class AuthRepo {
  Future<Either<String, UserEntity>> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  });

  // Future<void> login({
  //   required String email,
  //   required String password,
  // });
}
