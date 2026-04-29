import 'package:dartz/dartz.dart';
import 'package:grocery3/features/login/domain/entities/user_entity.dart';
import 'package:grocery3/features/login/domain/repositories/login_repo.dart';

class LoginUseCase {
  final LoginRepository repository;
  LoginUseCase(this.repository);

  Future<Either<String, AuthResult>> call({
    required String email,
    required String password,
  }) {
    return repository.login(email: email, password: password);
  }
}
