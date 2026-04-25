import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/profile/domain/entities/address_entity.dart';
import 'package:grocery3/features/profile/domain/repositories/profile_repository.dart';

class GetAddressesUseCase {
  final ProfileRepository repository;

  GetAddressesUseCase({required this.repository});

  Future<Either<Failure, List<AddressEntity>>> call() async {
    return await repository.getAddresses();
  }
}
