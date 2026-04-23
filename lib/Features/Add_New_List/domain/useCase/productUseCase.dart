import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/exception.dart';

import '../entity/productEntity.dart';
import '../repo/productRepo.dart';

class GetProductsUseCase {
  final ProductRepository repo;

  GetProductsUseCase(this.repo);

  Future<Either<ServerException, List<ProductEntity>>> call({String? query}) async {
    return await repo.getProducts(query: query);
  }
}