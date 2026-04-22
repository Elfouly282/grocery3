import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grocery3/core/error/exception.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:grocery3/features/profile/domain/entities/profile.dart';
import 'package:grocery3/features/profile/domain/repositories/profile_repository.dart';
import 'package:grocery3/features/profile/domain/usecases/update_profile.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final profile = await remoteDataSource.getProfile();
      return Right(profile);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? 'Server Error'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateProfile(
    UpdateProfileParams params,
  ) async {
    try {
      final profile = await remoteDataSource.updateProfile(params);
      return Right(profile);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? 'Server Error'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateImage(String imagePath) async {
    try {
      final profile = await remoteDataSource.updateImage(imagePath);
      return Right(profile);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? 'Server Error'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
