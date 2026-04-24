import 'package:grocery3/features/profile/domain/entities/update_profile_entity.dart';

class UpdateProfileModel extends UpdateProfileEntity {
  UpdateProfileModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.countryCode,
    required super.firstname,
    required super.lastname,
    required super.gender,
    required super.birthday,
    required super.id,
    required super.imgPath,
  });
    Map<String, dynamic> toJson() {
    return {
      "id": id,
      'profile_image_url': imgPath,
      'username': name,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'country_code': countryCode,
      'phone': phone,
      'preferred_languages[0]': countryCode,
      "full_name":name,  
    };
  }

factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
  return UpdateProfileModel(
    id: json["id"],
    name: json["username"],
    email: json["email"],
    phone: json["phone"],
    countryCode: json["country_code"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    gender: json["gender"],
    birthday: json["birthday"],
    imgPath: json["profile_image_url"],
  );
}  
}