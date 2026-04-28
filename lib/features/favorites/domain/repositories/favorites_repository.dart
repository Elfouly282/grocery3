import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/product_details/domain/entities/product.dart';

abstract class FavoritesRepository {
  Future<Either<ServerException, List<ProductEntity>>> getFavorites();
  Future<Either<ServerException, String>> toggleFavorite(String id);
}
