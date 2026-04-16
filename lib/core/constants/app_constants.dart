class AppConstants {
  static const String baseUrl = "";
  static const int connectTimeout = 30000; // 30 seconds

  
  // Header Constants
  static const String contentType = "application/json";
  static const String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';


  // Animation Durations
  static const int splashDelay = 3; // Seconds
  static const int animationDuration = 300; // Milliseconds

  // Pagination Constants
  static const int defaultPageSize = 10;
  static const double horizontalPadding = 16.0;
  static const double verticalPadding = 12.0;
  
  // Design Constants (Spacing)
  static const double borderRadius = 12.0;

  // Storage Keys (للتعامل مع SharedPreferences أو Secure Storage)
  static const String tokenKey = "user_token";
  static const String isUserLoggedIn = "is_logged_in";
  static const String languageKey = "app_lang";
}