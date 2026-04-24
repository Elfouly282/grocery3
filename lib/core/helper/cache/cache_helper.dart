import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  // Initialize the shared preferences
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // Generic method to get data (Static)
  static dynamic getData({required String key}) {
    return _sharedPreferences?.get(key);
  }

  // Method to set data (Static)
  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    if (_sharedPreferences == null) return false;

    if (value is bool) {
      return await _sharedPreferences!.setBool(key, value);
    }
    if (value is String) {
      return await _sharedPreferences!.setString(key, value);
    }
    if (value is int) {
      return await _sharedPreferences!.setInt(key, value);
    }
    if (value is double) {
      return await _sharedPreferences!.setDouble(key, value);
    }
    return false;
  }

  // Method to remove data
  static Future<bool> removeData({required String key}) async {
    return await _sharedPreferences?.remove(key) ?? false;
  }

  // Clear all data
  static Future<bool> clearData() async {
    return await _sharedPreferences?.clear() ?? false;
  }
}
