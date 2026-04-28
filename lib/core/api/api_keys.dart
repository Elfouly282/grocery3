class EndPoint {
  static const String baseUrl = "https://grocery.newcinderella.online";
  static const String login = "/api/auth/login";
  static const String register = "/api/auth/register";
  static const String verfiyEmail = "/api/auth/verify-email";
  static const String forgetPassword = "/api/auth/forgot-password";
  static const String resetPassword = "/api/auth/reset-password";
  static const String resendOTP = "/api/auth/resend-otp";
  static const String favorites = "/api/favorites";
  static const String toggleFavorite = "/api/favorites/";
  static const String orders = "/api/orders";
  static const String smartLists = "/api/smart-lists";
  // static const String cards = "/api/payment-cards";
  static const String getAllRecommendedProducts = "/api/meals/recommendations";
  static const String getAllTodayDeals = "/api/meals/today";
  static const String getAllCategory = "/api/categories";
  static const String meals = "/api/meals";
  static const String subCategories = "/api/subcategories";
  static const String cards = "/api/cards";

  static const String logout = "/auth/logout";
  static const String verifyOtp = "/auth/verify-otp";
  static const String changePassword = "/auth/change-password";
  static const String deleteAccount = "/auth/delete-account";

  // static const String products = "/meals";
  // static const String subCategories = "/subcategories";

  static const String todayDeals = "/meals/today";
  static const String hotMeals = "/meals/hot";
  static const String bestSells = "/best-sells";
  static const String newProducts = "/new-products";
  static const String addToCart = "/api/cart/items";
  static const String cart = "/api/cart";
  static const String cartUpdateQuantity = "/api/cart/items";
  static const String cartDeleteItem = "/api/cart/items";
  static const String cartDeleteAllItem = "/api/cart/clear";
}

class ApiKeys {
  static const String login = "login";
  static const String email = "email";
  static const String password = "password";
  static const String name = "name";
  static const String phone = "phoneNumber";
  static const String confirmPassword = "confirmPassword";
  static const String role = "role";
  static const String otp = "otp";
  static const String productId = "productId";
  static const String newPassword = "newPassword";
  static const String statusCode = "statusCode";
  static const String userId = "userId";
  static const String user = "user";
  static const String quantity = "quantity";
  static const String id = "id";
  static const String data = "data";
  static const String message = "message";
  static const String token = "token";
  static const String errors = "errors";
  static const String meta = "meta";
  static const String succeess = "success";
  static const String isLogged = "isLogged";
  static const String isVisitedOnBoarding = "isVisitedOnBoarding";
  static const String resetPasswordEmail = "resetPasswordEmail";
  static const String resetPasswordOtp = "resetPasswordOtp";
  static const String emailVerification = "EmailVerification";
  static const String passwordReset = "PasswordReset";
  static const String otpType = "otpType";
  static const String description = 'description';
  static const String imageUrl = 'imageUrl';
  static const String imaGeUrl = 'image_Url';
  static const String icon = 'icon';
  static const String isActive = 'isActive';
  static const String createdAt = 'createdAt';
  static const String rating = 'rating';
  static const String oldPrice = 'oldPrice';
  static const String weight = 'weight';
}

class StripeKeys {
  static const String publishableKey =
      "pk_test_51TOickRsbjFLOoimFJJoHxAVC6Zv8RLvHkscQSwgwgEFKyMNua0MX4uigF4z5bAAM5440SJyPS7sJAsi8z9zcBBs00AvZdbWph";
}

extension PaymentEndPoints on EndPoint {
  static const String savedCardsList = "/cards";
  static const String storeSavedCard = "/store";
  static const String paymentsHistory = "/payments/history";
  // Cart Specific
  static const String status = "status";
  static const String items = "items";
  static const String itemCount = "item_count";
  static const String subtotal = "subtotal";
  static const String tax = "tax";
  static const String discount = "discount";
  static const String total = "total";
  static const String isEmpty = "is_empty";

  static const String meal = "meal";
  static const String quantity = "quantity";
  static const String unitPrice = "unit_price";
  static const String discountAmount = "discount_amount";
  static const String title = "title";
  static const String slug = "slug";
  static const String price = "price";
  static const String discountPrice = "discount_price";
  static const String finalPrice = "final_price";
  static const String rating = "rating";
  static const String size = "size";
  static const String brand = "brand";
  static const String stockQuantity = "stock_quantity";
  static const String isAvailable = "is_available";
  static const String inStock = "in_stock";
  static const String mealId = "meal_id";

  static const String category = "category";
  static const String subcategory = "subcategory";
}
