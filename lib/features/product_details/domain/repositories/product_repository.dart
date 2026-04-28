import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/product_details/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<ServerException, ProductEntity>> getProductDetails(
    int id,
  );
}
