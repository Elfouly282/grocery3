import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/profile/domain/entities/add_address_params_entity.dart';
import 'package:grocery3/features/profile/domain/entities/address_entity.dart';
import 'package:grocery3/features/profile/domain/repositories/profile_repository.dart';

class AddAddressUseCase {
  final ProfileRepository repository;

  AddAddressUseCase({required this.repository});

  Future<Either<Failure, AddressEntity>> call(AddAddressParamsEntity params) async {
    return await repository.addAddress(params);
  }
}
