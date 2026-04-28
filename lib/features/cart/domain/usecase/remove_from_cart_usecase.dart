// domain/usecases/remove_from_cart_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:grocery3/features/cart/domain/repo/cart_repo.dart';

class RemoveFromCartUseCase {
  final CartRepository repository;
  
  RemoveFromCartUseCase(this.repository);

  Future<Either<String, void>> call({required int cartItemId}) {
    return repository.removeFromCart(cartItemId: cartItemId);
  }
}
