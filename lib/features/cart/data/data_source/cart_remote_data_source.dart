// data/datasources/cart_remote_data_source.dart
import 'dart:developer';

import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/api/api_keys.dart';
import 'package:grocery3/core/helper/security/security_helper.dart';
import 'package:grocery3/features/cart/data/model/cart_item_model.dart';

class CartRemoteDataSource {
  final ApiConsumer api;

  CartRemoteDataSource({required this.api});

  Future<CartModel> getCart() async {
    final token = await SecureStorageService().getRefreshToken();
    log(token.toString());
    final response = await api.get(
      EndPoint.cart,
      headers: {'Authorization': 'Bearer $token'},
    );
    return CartModel.fromJson(response);
  }

  Future<CartModel> addToCart({
    required int productId,
    required int quantity,
  }) async {
    final token = await SecureStorageService().getRefreshToken();
    final response = await api.post(
      EndPoint.addToCart,
      data: {ApiKeys.productId: productId, ApiKeys.quantity: quantity},
      isFromData: true,
            headers: {'Authorization': 'Bearer $token'},

    );
    return CartModel.fromJson(response);
  }

  Future<CartModel> updateCartItem({
    required int cartItemId,
    required int quantity,
  }) async {
    final response = await api.put(
      '${EndPoint.cart}/$cartItemId',
      data: {ApiKeys.quantity: quantity},

      isFromData: true,
    );
    return CartModel.fromJson(response);
  }

  Future<void> removeFromCart({required int cartItemId}) async {
    await api.delete('${EndPoint.cartDeleteAllItem}/$cartItemId');
  }

  Future<void> clearCart() async {
    await api.delete(EndPoint.cart);
  }
}
