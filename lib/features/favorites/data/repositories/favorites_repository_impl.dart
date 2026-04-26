import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/product_details/domain/entities/product.dart';
import 'package:grocery3/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:grocery3/features/favorites/data/datasources/favorites_remote_data_source.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;

  FavoritesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavorites() async {
    try {
      final favorites = await remoteDataSource.getFavorites();
      return Right(favorites);
    } catch (e) {
      if (e is DioException) {
         return Left(ServerFailure(e.response?.data['message'] ?? 'Server Error'));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> toggleFavorite(int id) async {
    try {
      final message = await remoteDataSource.toggleFavorite(id);
      return Right(message);
    } catch (e) {
      if (e is DioException) {
         return Left(ServerFailure(e.response?.data['message'] ?? 'Server Error'));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
