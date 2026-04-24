import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/exception.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/forget_password/data/datasources/forget_password_remote_data_source.dart';
import 'package:grocery3/features/forget_password/data/models/reset_password_model.dart';
import 'package:grocery3/features/forget_password/data/models/verify_otp_model.dart';
import 'package:grocery3/features/forget_password/domain/entities/reset_password_entity.dart';
import 'package:grocery3/features/forget_password/domain/entities/verify_otp_entity.dart';
import 'package:grocery3/features/forget_password/domain/repositories/forget_password_repository.dart';

class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  final ForgetPasswordRemoteDataSource remoteDataSource;

  ForgetPasswordRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> forgetPassword(String emailOrPhone) async {
    try {
      await remoteDataSource.forgetPassword(emailOrPhone);
      return Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp({
    required VerifyOtpEntity verifyOtpEntity,
  }) async {
    try {
      await remoteDataSource.verifyOtp(
        otpModel: VerifyOtpModel(
          otp: verifyOtpEntity.otp,
          identifier: verifyOtpEntity.identifier,
        ),
      );

      return Right(null);
    } on ServerException catch (e) {
      print("E..Here");
      return Left(ServerFailure(e.errModel.message ?? 'Server Error'));
    } catch (e) {

      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required ResetPasswordEntity resetPasswordEntity,
  }) async {
    try {
      final message = await remoteDataSource.resetPassword(
        resetPasswordModel: ResetPasswordModel(
          otp: resetPasswordEntity.otp,
          identifier: resetPasswordEntity.identifier,
          password: resetPasswordEntity.password,
          confirmPassword: resetPasswordEntity.confirmPassword,
        ),
      );
      return Right(message);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
