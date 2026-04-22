import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/profile/domain/entities/profile.dart';
import 'package:grocery3/features/profile/domain/repositories/profile_repository.dart';

class UpdateImageUseCase {
  final ProfileRepository repository;

  UpdateImageUseCase({required this.repository});

  Future<Either<Failure, ProfileEntity>> call(String imagePath) async {
    return await repository.updateImage(imagePath);
  }
}
