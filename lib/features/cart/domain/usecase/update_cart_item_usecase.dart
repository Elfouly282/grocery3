// domain/usecases/update_cart_item_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:grocery3/features/cart/domain/entitis/cart_item_entity.dart';
import 'package:grocery3/features/cart/domain/repo/cart_repo.dart';

class UpdateCartItemUseCase {
  final CartRepository repository;
  
  UpdateCartItemUseCase(this.repository);

  Future<Either<String, Cart>> call({
    required int cartItemId,
    required int quantity,
  }) {
    return repository.updateCartItem(
      cartItemId: cartItemId,
      quantity: quantity,
    );
  }
}
