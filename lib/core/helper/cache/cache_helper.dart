import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  static set sharedPreferences(SharedPreferences value) {
    _sharedPreferences = value;
  }

  static SharedPreferences get sharedPreferences {
    if (_sharedPreferences == null) {
      throw Exception("CacheHelper: SharedPreferences not initialized! Call setupServiceLocator() first.");
    }
    return _sharedPreferences!;
  }

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  String? getDataString({required String key}) {
    return _sharedPreferences?.getString(key);
  }

  Future<bool> setData({required String key, required dynamic value}) async {
    if (_sharedPreferences == null) return false;
    
    if (value is bool) {
      return await _sharedPreferences!.setBool(key, value);
    }
    if (value is String) {
      return await _sharedPreferences!.setString(key, value);
    }

    if (value is int) {
      return await _sharedPreferences!.setInt(key, value);
    } else {
      return await _sharedPreferences!.setDouble(key, value);
    }
  }

  dynamic getData({required String key}) {
    return _sharedPreferences?.get(key);
  }

  Future<bool> removeData({required String key}) async {
    if (_sharedPreferences == null) return false;
    return await _sharedPreferences!.remove(key);
  }

  Future<bool> containsKey({required String key}) async {
    return _sharedPreferences?.containsKey(key) ?? false;
  }

  Future<bool> clearData() async {
    if (_sharedPreferences == null) return false;
    return await _sharedPreferences!.clear();
  }

  Future<dynamic> put({required String key, required dynamic value}) async {
    if (_sharedPreferences == null) return false;
    if (value is String) {
      return await _sharedPreferences!.setString(key, value);
    } else if (value is bool) {
      return await _sharedPreferences!.setBool(key, value);
    } else {
      return await _sharedPreferences!.setInt(key, value);
    }
  }
}
