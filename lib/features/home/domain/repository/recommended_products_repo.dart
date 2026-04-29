import 'package:dartz/dartz.dart';
import 'package:grocery3/features/home/domain/entities/recommended_products_entity.dart';

abstract class RecommendedProductsRepo {
  Future<Either<String, List<RecommendedProductsEntity>>>
  getAllRecommendedProducts();
}
