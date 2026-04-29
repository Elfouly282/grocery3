import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grocery3/core/error/error_model.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/product_details/domain/entities/product.dart';
import 'package:grocery3/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:grocery3/features/favorites/data/datasources/favorites_remote_data_source.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;

  FavoritesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ServerException, List<ProductEntity>>>
  getFavorites() async {
    try {
      final favorites = await remoteDataSource.getFavorites();
      return Right(favorites);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerException(
            e.response?.data['message'] ?? 'Server Error',
            errModel: ErrorModel(
              message: e.response?.data['message'] ?? 'Server Error',
            ),
          ),
        );
      }
      return Left(
        ServerException(
          e.toString(),
          errModel: ErrorModel(message: e.toString()),
        ),
      );
    }
  }

  @override
  Future<Either<ServerException, String>> toggleFavorite(String id) async {
    try {
      final message = await remoteDataSource.toggleFavorite(id);
      return Right(message);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerException(
            e.response?.data['message'] ?? 'Error',
            errModel: ErrorModel(
              message: e.response?.data['message'] ?? 'Error',
            ),
          ),
        );
      }
      return Left(
        ServerException(
          e.toString(),
          errModel: ErrorModel(message: e.toString()),
        ),
      );
    }
  }
}
