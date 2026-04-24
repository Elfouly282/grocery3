import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/forget_password/domain/entities/verify_otp_entity.dart';
import 'package:grocery3/features/forget_password/domain/repositories/forget_password_repository.dart';

class VerifyOtpUseCase {
  final ForgetPasswordRepository repository;

  VerifyOtpUseCase({required this.repository});

  Future<Either<Failure,void >> call({
    required VerifyOtpEntity verifyOtpEntity , 
  }) async{
    return await  repository.verifyOtp(verifyOtpEntity: verifyOtpEntity);
  }
}
