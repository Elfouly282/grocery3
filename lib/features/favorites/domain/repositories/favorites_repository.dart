import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../product_details/domain/entities/product.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<ProductEntity>>> getFavorites();
  Future<Either<Failure, String>> toggleFavorite(int id);
}
