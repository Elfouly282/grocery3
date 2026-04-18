import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/smart_lists/domain/entities/smart_list.dart';
import 'package:grocery3/features/smart_lists/domain/repositories/smart_lists_repository.dart';
import 'package:grocery3/features/smart_lists/data/datasources/smart_lists_remote_data_source.dart';

class SmartListsRepositoryImpl implements SmartListsRepository {
  final SmartListsRemoteDataSource remoteDataSource;

  SmartListsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<SmartListEntity>>> getSmartLists() async {
    try {
      final lists = await remoteDataSource.getSmartLists();
      return Right(lists);
    } catch (e) {
      if (e is DioException) {
         return Left(ServerFailure(e.response?.data['message'] ?? 'Server Error'));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SmartListEntity>> getSmartListDetails(int id) async {
    try {
      final list = await remoteDataSource.getSmartListDetails(id);
      return Right(list);
    } catch (e) {
      if (e is DioException) {
         return Left(ServerFailure(e.response?.data['message'] ?? 'Server Error'));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
