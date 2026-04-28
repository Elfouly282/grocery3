// domain/repositories/cart_repo.dart
import 'package:dartz/dartz.dart';
import 'package:grocery3/features/cart/domain/entitis/cart_item_entity.dart';

abstract class CartRepository {
  Future<Either<String, Cart>> getCart();
  
  Future<Either<String, Cart>> addToCart({
    required int productId,
    required int quantity,
  });
  
  Future<Either<String, Cart>> updateCartItem({
    required int cartItemId,
    required int quantity,
  });
  
  Future<Either<String, void>> removeFromCart({required int cartItemId});
  
  Future<Either<String, void>> clearCart();
}
