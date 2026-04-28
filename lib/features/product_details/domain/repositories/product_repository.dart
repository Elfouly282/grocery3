import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/product_list/domin/product_entity.dart';
import '../entities/product.dart' hide ProductEntityForCart;

abstract class ProductRepository {
  Future<Either<ServerException, ProductEntity>> getProductDetails(
    String id,
  );
}
