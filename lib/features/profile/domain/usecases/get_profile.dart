import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/profile/domain/entities/profile_user_entity.dart';
import 'package:grocery3/features/profile/domain/repositories/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase({required this.repository});

  Future<Either<Failure, ProfileUserEntity>> call() async {
    return await repository.getProfile();
  }
}
