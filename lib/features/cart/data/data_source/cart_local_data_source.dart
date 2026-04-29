// data/datasources/cart_local_data_source.dart
import 'dart:convert';
import 'package:grocery3/features/cart/data/model/cart_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String _cartKey = 'CACHED_CART';

  CartLocalDataSource({required this.sharedPreferences});

  Future<List<CartItemModel>> getCachedCart() async {
    final jsonString = sharedPreferences.getString(_cartKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  Future<void> cacheCart(List<CartItemModel> items) async {
    final jsonString = json.encode(
      items.map((item) => (item).toJson()).toList(),
    );
    await sharedPreferences.setString(_cartKey, jsonString);
  }

  Future<void> clearCart() async {
    await sharedPreferences.remove(_cartKey);
  }
}
