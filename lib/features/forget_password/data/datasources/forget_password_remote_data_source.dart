import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/api/api_keys.dart';
import 'package:grocery3/features/forget_password/data/models/reset_password_model.dart';
import 'package:grocery3/features/forget_password/data/models/verify_otp_model.dart';
import 'package:grocery3/features/forget_password/domain/entities/verify_otp_entity.dart';

abstract class ForgetPasswordRemoteDataSource {
  Future<void> forgetPassword(String emailOrPhone);

  Future<void> verifyOtp({required VerifyOtpModel otpModel});

  Future<void> resetPassword({required ResetPasswordModel resetPasswordModel});
}

class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSource {
  final ApiConsumer api;

  ForgetPasswordRemoteDataSourceImpl({required this.api});

  @override
  Future<void> forgetPassword(String emailOrPhone) async {
    final body = {ApiKeys.identifier: emailOrPhone};
    final response = await api.post(EndPoint.forgetPassword, data: body);
    print(response);
  }

  @override
  Future<void> verifyOtp({required VerifyOtpModel otpModel}) async {
    await api.post(
      EndPoint.verifyOtp,
      data: {
        ApiKeys.otp: otpModel.otp,
        ApiKeys.identifier: otpModel.identifier,
      },
    );
  }

  @override
  Future<void> resetPassword({
    required ResetPasswordModel resetPasswordModel,
  }) async {
    await api.post(
      EndPoint.resetPassword,
      data: {
        ApiKeys.otp: resetPasswordModel.otp,
        ApiKeys.id: resetPasswordModel.identifier,
        ApiKeys.password: resetPasswordModel.password,
        ApiKeys.confirmPassword: resetPasswordModel.confirmPassword,
      },
    );
  }
}
