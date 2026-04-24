import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/profile/domain/entities/update_profile_entity.dart';
import 'package:grocery3/features/profile/domain/repositories/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase({required this.repository});

  Future<Either<Failure, UpdateProfileEntity>> call(
    UpdateProfileEntity params,
  ) async {
    return await repository.updateProfile(params);
  }
}
