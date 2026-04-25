class EndPoint {
  static const String baseUrl = "https://grocery.newcinderella.online/api";
  static const String login = "/api/v1/auth/login";
  static const String register = "/api/v1/auth/register";
  static const String verfiyEmail = "/auth/verify-email";
  static const String forgetPassword = "/auth/forgot-password";
  static const String verifyOtp = "/auth/verify-otp";
  static const String resetPassword = "/auth/reset-password";
  static const String resendOTP = "/auth/resend-otp";
  static const String favorites = "/favorites";
  static const String toggleFavorite = "/favorites/";
  static const String orders = "/orders";
  static const String smartLists = "/smart-lists";
  static const String cards = "/payment-cards";
  static const String profile = "/profile";
  static const String updateProfile = "/profile/info";
  static const String updateProfileImage = "/profile/image";
  static const String addresses = "/addresses";
}

class ApiKeys {
  static const String email = "email";
  static const String password = "password";
  static const String name = "name";
  static const String phone = "phoneNumber";
  static const String confirmPassword = "confirmPassword";
  static const String role = "role";
  static const String otp = "otp";
  static const String newPassword = "newPassword";
  static const String statusCode = "statusCode";
  static const String userId = "userId";
  static const String id = "id";
  static const String data = "data";
  static const String message = "message";
  static const String token = "token";
  static const String errors = "errors";
  static const String meta = "meta";
  static const String succeeded = "succeeded";
  static const String isLogged = "isLogged";
  static const String isVisitedOnBoarding = "isVisitedOnBoarding";
  static const String resetPasswordEmail = "resetPasswordEmail";
  static const String resetPasswordOtp = "resetPasswordOtp";
  static const String emailVerification = "EmailVerification";
  static const String passwordReset = "PasswordReset";
  static const String otpType = "otpType";
  static const String description = 'description';
  static const String imageUrl = 'imageUrl';
  static const String icon = 'icon';
  static const String isActive = 'isActive';
  static const String createdAt = 'createdAt';
}
