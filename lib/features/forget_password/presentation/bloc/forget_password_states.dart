abstract class ForgetPasswordStates {}
 class IntailForgetPasswordState extends ForgetPasswordStates {}


class LoadingForgetPasswordState extends ForgetPasswordStates {}

class SuccessForgetPasswordState extends ForgetPasswordStates {}

class ErrorForgetPasswordState extends ForgetPasswordStates {
  final String message;

  ErrorForgetPasswordState({required this.message}); 
}

class LoadingVerifyOtpState extends ForgetPasswordStates {}

class SuccessVerifyOtpState extends ForgetPasswordStates {}

class ErrorVerifyOtpState extends ForgetPasswordStates {
  final String message;

  ErrorVerifyOtpState({required this.message});

}

class LoadingResetPasswordState extends ForgetPasswordStates {}

class SuccessResetPasswordState extends ForgetPasswordStates {}

class ErrorResetPasswordState extends ForgetPasswordStates {
  final String message;

  ErrorResetPasswordState({required this.message});
}
