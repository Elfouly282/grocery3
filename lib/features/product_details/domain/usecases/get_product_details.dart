import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductDetailsUseCase {
  final ProductRepository repository;

  GetProductDetailsUseCase(this.repository);

  Future<Either<ServerException, ProductEntity>> call(String id) async {
    return await repository.getProductDetails(id);
  }
}
