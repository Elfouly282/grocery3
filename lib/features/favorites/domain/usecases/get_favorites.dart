import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../product_details/domain/entities/product.dart';
import '../repositories/favorites_repository.dart';

class GetFavoritesUseCase {
  final FavoritesRepository repository;

  GetFavoritesUseCase({required this.repository});

  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await repository.getFavorites();
  }
}
