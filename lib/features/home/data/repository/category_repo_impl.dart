import 'package:dartz/dartz.dart';
import 'package:grocery3/core/connection/network_info.dart';
import 'package:grocery3/core/error/exception.dart';
import 'package:grocery3/features/home/data/datasources/remote_data_sources.dart';
import 'package:grocery3/features/home/domain/entities/category_entity.dart';
import 'package:grocery3/features/home/domain/repository/category_repo.dart';

class CategoryRepoImpl extends CategoryRepo {
  final RemoteDataSources remoteDataSources;
  final NetworkInfo networkInfo;

  CategoryRepoImpl({
    required this.remoteDataSources,
    required this.networkInfo,
  });

  @override
  Future<Either<String, List<CategoryEntity>>> getAllCategories() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteDataSource = await remoteDataSources.getAllCategories();
        return Right(remoteDataSource.data);
      } on ServerException catch (e) {
        return Left(e.errModel.message.toString());
      }
    } else {
      return Left('No internet connection');
    }
  }
}
