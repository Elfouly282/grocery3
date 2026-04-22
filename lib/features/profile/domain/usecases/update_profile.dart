import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/profile/domain/entities/profile.dart';
import 'package:grocery3/features/profile/domain/repositories/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase({required this.repository});

  Future<Either<Failure, ProfileEntity>> call(UpdateProfileParams params) async {
    return await repository.updateProfile(params);
  }
}

class UpdateProfileParams {
  final String? name;
  final String? email;
  final String? phone;
  final String? countryCode;
  final String? firstname;
  final String? lastname;
  final String? gender;
  final String? birthday;

  const UpdateProfileParams({
    this.name,
    this.email,
    this.phone,
    this.countryCode,
    this.firstname,
    this.lastname,
    this.gender,
    this.birthday,
  });

  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (countryCode != null) 'country_code': countryCode,
      if (firstname != null) 'firstname': firstname,
      if (lastname != null) 'lastname': lastname,
      if (gender != null) 'gender': gender,
      if (birthday != null) 'birthday': birthday,
    };
  }
}
