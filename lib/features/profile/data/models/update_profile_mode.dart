import 'package:grocery3/features/profile/domain/entities/update_profile_entity.dart';

class UpdateProfileModel extends UpdateProfileEntity {
  final int? id;

  UpdateProfileModel({
    this.id,
    super.userName,
    super.firstName,
    super.lastName,
    super.email,
    super.phone,
    super.countryCode,
    super.preferredLanguages,
  });
  Map<String, dynamic> toJson() {
    return {
      "username": userName ?? '',
      "firstname": firstName ?? '',
      "lastname": lastName ?? '',
      "email": email ?? '',
      "phone": phone ?? '',
      "country_code": countryCode ?? '',
      "preferred_languages": preferredLanguages,
    };
  }

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    // Handle response with 'data' wrapper
    Map<String, dynamic> data = json;
    if (json.containsKey('data') && json['data'] is Map) {
      data = Map<String, dynamic>.from(json['data']);
    }

    // Helper function to safely convert any value to string
    String safeToString(dynamic value) {
      if (value == null) return '';
      if (value is String) return value;
      if (value is Map) return '';
      return value.toString();
    }

    // Helper function to safely convert to int
    int? safeToInt(dynamic value) {
      if (value == null) return null;
      if (value is int) return value;
      if (value is String) return int.tryParse(value);
      return null;
    }

    return UpdateProfileModel(
      id: safeToInt(data['id']),
      countryCode: safeToString(data['country_code']),
      email: safeToString(data['email']),
      firstName: safeToString(data['firstname']),
      lastName: safeToString(data['lastname']),
      phone: safeToString(data['phone']),
      preferredLanguages: data['preferred_languages'] as List?,
      userName: safeToString(data['username']),
    );
  }
}
