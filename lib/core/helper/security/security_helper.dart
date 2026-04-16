import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  // singleton
  static final SecureStorageService _instance =
      SecureStorageService._internal();

  factory SecureStorageService() => _instance;

  SecureStorageService._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // ==========================
  // 🔑 Keys (ثابتة)
  // ==========================
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _userIdKey = 'user_id';

  // ==========================
  // ✍️ Write Methods
  // ==========================
  Future<void> setAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  Future<void> setRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  Future<void> setUserId(String userId) async {
    await _storage.write(key: _userIdKey, value: userId);
  }

  // ==========================
  // 📖 Read Methods
  // ==========================
  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<String?> getUserId() async {
    return await _storage.read(key: _userIdKey);
  }

  // ==========================
  // ❌ Delete Methods
  // ==========================
  Future<void> deleteAccessToken() async {
    await _storage.delete(key: _accessTokenKey);
  }

  Future<void> deleteRefreshToken() async {
    await _storage.delete(key: _refreshTokenKey);
  }

  Future<void> deleteUserId() async {
    await _storage.delete(key: _userIdKey);
  }

  // ==========================
  // 🧹 Clear All
  // ==========================
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  // ==========================
  // 🔥 Helper Methods (جديدة ومهمة)
  // ==========================

  /// حفظ كل بيانات اليوزر مرة واحدة
  Future<void> saveUserSession({
    required String accessToken,
    required String refreshToken,
    required String userId,
  }) async {
    await setAccessToken(accessToken);
    await setRefreshToken(refreshToken);
    await setUserId(userId);
  }

  /// هل المستخدم مسجل دخول؟
  Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }
}