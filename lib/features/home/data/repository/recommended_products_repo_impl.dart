import 'package:dartz/dartz.dart';
import 'package:grocery3/core/connection/network_info.dart';
import 'package:grocery3/core/error/exception.dart';
import 'package:grocery3/features/home/data/datasources/remote_data_sources.dart';
import 'package:grocery3/features/home/domain/entities/recommended_products_entity.dart';
import 'package:grocery3/features/home/domain/repository/recommended_products_repo.dart';

class RecommendedProductsRepoImpl extends RecommendedProductsRepo {
  final RemoteDataSources remoteDataSources;
  final NetworkInfo networkInfo;

  RecommendedProductsRepoImpl({
    required this.remoteDataSources,
    required this.networkInfo,
  });
  @override
  Future<Either<String, List<RecommendedProductsEntity>>>
  getAllRecommendedProducts() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteDataSource = await remoteDataSources
            .getAllRecommendedProducts();
        return Right(remoteDataSource.data);
      } on ServerException catch (e) {
        return left(e.errModel.message.toString());
      }
    } else {
      return Left('No internet connection');
    }
  }
}
