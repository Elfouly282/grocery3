import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grocery3/core/error/exception.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:grocery3/features/profile/data/models/update_profile_mode.dart';
import 'package:grocery3/features/profile/domain/entities/profile_user_entity.dart';
import 'package:grocery3/features/profile/domain/entities/update_profile_entity.dart';
import 'package:grocery3/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ProfileUserEntity>> getProfile() async {
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
  Future<Either<Failure, UpdateProfileModel>> updateProfile(
    UpdateProfileEntity params,
  ) async {
    try {
      final profile = await remoteDataSource.updateProfile(
        UpdateProfileModel(
          imgPath: params.imgPath,
          id: params.id,
          name: params.name,
          email: params.email,
          phone: params.phone,
          countryCode: params.countryCode,
          firstname: params.firstname,
          lastname: params.lastname,
          gender: params.gender,
          birthday: params.birthday,
        ),
      );
      return Right(profile);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? 'Server Error'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure("Some Thing Went Wrong  "));
    }
  }

  @override
  Future<Either<Failure, String>> updateImage(String imagePath) async {
    try {
      final img = await remoteDataSource.updateImage(imagePath);
      return Right(img);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? 'Server Error'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
