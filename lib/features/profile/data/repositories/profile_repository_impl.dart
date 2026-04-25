import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grocery3/core/error/exception.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:grocery3/features/profile/data/models/add_address_params_model.dart';
import 'package:grocery3/features/profile/data/models/update_profile_mode.dart';
import 'package:grocery3/features/profile/domain/entities/add_address_params_entity.dart';
import 'package:grocery3/features/profile/domain/entities/address_entity.dart';
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
  Future<Either<Failure, List<AddressEntity>>> getAddresses() async {
    try {
      final addresses = await remoteDataSource.getAddresses();
      return Right(addresses);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? 'Server Error'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddressEntity>> addAddress(
    AddAddressParamsEntity params,
  ) async {
    try {
      final addedAddress = await remoteDataSource.addAddress(
        AddAddressParamsModel.fromEntity(params),
      );
      return Right(addedAddress);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? 'Server Error'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpdateProfileEntity>> updateProfile(
    UpdateProfileEntity params,
  ) async {
    try {
      final profileModel = await remoteDataSource.updateProfile(
        UpdateProfileModel(
          userName: params.userName ?? '',
          firstName: params.firstName ?? '',
          lastName: params.lastName ?? '',
          email: params.email ?? '',
          phone: params.phone ?? '',
          countryCode: params.countryCode ?? '',
          preferredLanguages: params.preferredLanguages,
        ),
      );
      return Right(profileModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.message ?? 'Server Error'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
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
