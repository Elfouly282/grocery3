abstract class ForgetPasswordEvents {}

class ForgetPasswordEvent implements ForgetPasswordEvents {
  final String emailOrPhone;
  ForgetPasswordEvent({required this.emailOrPhone});
}

class VerifyOtpEvent implements ForgetPasswordEvents {
  final String otp;
  VerifyOtpEvent({required this.otp});
}

class ResetPasswordEvent implements ForgetPasswordEvents {
  final String newPassword;
  final String confirmPassword;
  ResetPasswordEvent({required this.newPassword, required this.confirmPassword});
}
