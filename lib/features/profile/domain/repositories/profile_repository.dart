import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/profile/domain/entities/profile.dart';
import 'package:grocery3/features/profile/domain/usecases/update_profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> getProfile();
  Future<Either<Failure, ProfileEntity>> updateProfile(
    UpdateProfileParams params,
  );
  Future<Either<Failure, ProfileEntity>> updateImage(String imagePath);
}
