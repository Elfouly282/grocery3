import 'package:dartz/dartz.dart';
import 'package:grocery3/features/home/domain/entities/recommended_products_entity.dart';
import 'package:grocery3/features/home/domain/repository/recommended_products_repo.dart';

class GetAllRecommendedProductsUsecase {
  final RecommendedProductsRepo recommendedProductsRepo;

  GetAllRecommendedProductsUsecase({required this.recommendedProductsRepo});
  Future<Either<String, List<RecommendedProductsEntity>>> call() async {
    return await recommendedProductsRepo.getAllRecommendedProducts();
  }
}
