class EndPoint {
  static const String baseUrl = "https://grocery.newcinderella.online/api";

  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String logout = "/auth/logout";
  static const String forgetPassword = "/auth/forgot-password";
  static const String verifyOtp = "/auth/verify-otp";
  static const String resetPassword = "/auth/reset-password";
  static const String changePassword = "/auth/change-password";
  static const String deleteAccount = "/auth/delete-account";

  static const String products = "/meals";
  static const String subCategories = "/subcategories";

  // روابط إضافية مفيدة من الـ Postman
  static const String todayDeals = "/meals/today";
  static const String hotMeals = "/meals/hot";
  static const String bestSells = "/best-sells";
  static const String newProducts = "/new-products";
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
  static const String rating = 'rating';
  static const String oldPrice = 'oldPrice';
  static const String weight = 'weight';
}
