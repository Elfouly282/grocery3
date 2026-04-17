import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failure.dart';
import '../../product_details/domain/entities/product.dart';
import '../../domain/repositories/favorites_repository.dart';
import '../datasources/favorites_remote_data_source.dart';

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
