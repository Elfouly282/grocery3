class ResetPasswordEntity {
  final String otp;
  final String identifier;
  final String password;
  final String confirmPassword;

  ResetPasswordEntity({required this.otp, required this.identifier, required this.password, required this.confirmPassword});
}
