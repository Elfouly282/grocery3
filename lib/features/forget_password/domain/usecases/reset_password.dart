import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/forget_password/domain/entities/reset_password_entity.dart';
import 'package:grocery3/features/forget_password/domain/repositories/forget_password_repository.dart';

class ResetPasswordUseCase {
  final ForgetPasswordRepository repository;

  ResetPasswordUseCase({required this.repository});

  Future<Either<Failure, void>> call({
   required ResetPasswordEntity resetPasswordEntity
  }) async {
   
   return await repository.resetPassword(resetPasswordEntity: resetPasswordEntity); 
  }
}
