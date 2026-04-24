import 'package:grocery3/features/profile/domain/entities/profile_user_entity.dart';

class ProfileUserModel extends ProfileUserEntity {
  ProfileUserModel({
    required super.id,
    required super.username,
    required super.email,
    required super.phone,
    required super.countryCode,
    required super.emailVerified,
    required super.phoneVerified,
    required super.createdAt,
    required super.updatedAt,
    required super.birthday,
    required super.firstname,
    required super.gender,
    required super.lastname,
    required super.name,
    required super.preferredLanguages,
    required super.profilePicture,
  });
  factory ProfileUserModel.fromJson(Map<String, dynamic> json) {
    return ProfileUserModel(
      id: json['id'],
      profilePicture: json['profile_picture'],
      name: json['name'],
      username: json['username'],
      firstname: json['firstname'] ?? '',
      lastname: json['lastname'] ?? '',
      gender: json['gender'],
      birthday: json['birthday'],
      email: json['email'],
      phone: json['phone'],
      countryCode: json['country_code'],
      emailVerified: json['email_verified'],
      phoneVerified: json['phone_verified'],
      preferredLanguages: List<String>.from(json['preferred_languages'] ?? []),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
