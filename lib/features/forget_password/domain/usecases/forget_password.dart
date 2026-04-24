import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/forget_password/domain/repositories/forget_password_repository.dart';

class ForgetPasswordUseCase {
  final ForgetPasswordRepository repository;

  ForgetPasswordUseCase({required this.repository});

  Future<Either<Failure, void>> call(String emailOrPhone) {
    return repository.forgetPassword(emailOrPhone);
  }
}
