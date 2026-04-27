import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<ServerException, ProductEntity>> getProductDetails(String id);
}
