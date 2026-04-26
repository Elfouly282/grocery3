// domain/usecases/get_cart_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:grocery3/features/cart/domain/entitis/cart_item_entity.dart';
import 'package:grocery3/features/cart/domain/repo/cart_repo.dart';

class GetCartUseCase {
  final CartRepository repository;
  
  GetCartUseCase(this.repository);

  Future<Either<String, Cart>> call() {
    return repository.getCart();
  }
}
