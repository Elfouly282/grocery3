import 'package:dartz/dartz.dart';
import 'package:grocery3/features/login/domain/entities/user_entity.dart';

abstract class LoginRepository {
  Future<Either<String, AuthResult>> login({
    required String email,
    required String password,
  });
}
