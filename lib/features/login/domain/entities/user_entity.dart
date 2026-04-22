// domain/entities/user.dart
class User {
  final int id;
  final String username;
  final String email;
  final String phone;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
  });
}

// domain/entities/auth_result.dart
class AuthResult {
  final User user;
  final String token;

  AuthResult({
    required this.user,
    required this.token,
  });
}