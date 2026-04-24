import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/forget_password/domain/entities/reset_password_entity.dart';
import 'package:grocery3/features/forget_password/domain/entities/verify_otp_entity.dart';

abstract class ForgetPasswordRepository {
  Future<Either<Failure, void>> forgetPassword(String emailOrPhone);

  Future<Either<Failure, void>> verifyOtp({
  required VerifyOtpEntity verifyOtpEntity
  });

  Future<Either<Failure, void>> resetPassword({
   required ResetPasswordEntity resetPasswordEntity 
  });
}

