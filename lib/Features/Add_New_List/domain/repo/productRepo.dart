  import 'package:dartz/dartz.dart';
  import 'package:grocery3/core/error/exception.dart';

  import '../entity/productEntity.dart';

  abstract class ProductRepository {
    Future<Either<ServerException, List<ProductEntity>>> getProducts({
      String? query,
    });
  }