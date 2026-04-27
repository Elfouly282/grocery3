import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/error_model.dart';
import 'package:grocery3/core/error/failures.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ServerException, ProductEntity>> getProductDetails(
    String id,
  ) async {
    try {
      final product = await remoteDataSource.getProductDetails(id);
      return Right(product);
    } on ServerException catch (e) {
      return Left(ServerException(e.message, errModel: e.errModel));
    } catch (e) {
      return Left(
        ServerException(
          e.toString(),
          errModel: ErrorModel(message: e.toString()),
        ),
      );
    }
  }
}
