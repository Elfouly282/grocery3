import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/product_details/domain/entities/product.dart';
import 'package:grocery3/features/favorites/domain/repositories/favorites_repository.dart';

class GetFavoritesUseCase {
  final FavoritesRepository repository;

  GetFavoritesUseCase({required this.repository});

  Future<Either<ServerException, List<ProductEntity>>> call() async {
    return await repository.getFavorites();
  }
}
