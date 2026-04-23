import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/error_model.dart';
import 'package:grocery3/core/error/exception.dart';

import '../../domain/entity/productEntity.dart';
import '../../domain/repo/productRepo.dart';
import '../datasources/productRemoteDataSource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  Future<Either<ServerException, List<ProductEntity>>> getProducts({String? query}) async {
    try {
      final products = await remoteDataSource.getProducts(query: query);
      return Right(products);
    } on ServerException catch (e) {
      return Left(e);
    }
  }
}