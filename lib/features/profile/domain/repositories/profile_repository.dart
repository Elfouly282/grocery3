import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/profile/domain/entities/add_address_params_entity.dart';
import 'package:grocery3/features/profile/domain/entities/address_entity.dart';
import 'package:grocery3/features/profile/domain/entities/profile_user_entity.dart';
import 'package:grocery3/features/profile/domain/entities/update_profile_entity.dart';


abstract class ProfileRepository {
  Future<Either<Failure, ProfileUserEntity>> getProfile();
  Future<Either<Failure, List<AddressEntity>>> getAddresses();
  Future<Either<Failure, AddressEntity>> addAddress(AddAddressParamsEntity params);
  Future<Either<Failure, UpdateProfileEntity>> updateProfile(
    UpdateProfileEntity params,
  );
  Future<Either<Failure, String>> updateImage(String imagePath);
}
