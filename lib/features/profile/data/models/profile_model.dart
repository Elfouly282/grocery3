import 'package:grocery3/core/api/api_keys.dart';
import 'package:grocery3/features/profile/domain/entities/profile.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required super.success,
    required super.message,
    required ProfileDataModel super.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      success: json[ApiKeys.succeeded] ?? false,
      message: json[ApiKeys.message] ?? '',
      data: ProfileDataModel.fromJson(json[ApiKeys.data] ?? {}),
    );
  }
}

class ProfileDataModel extends ProfileDataEntity {
  ProfileDataModel({
    required ProfileUserModel super.me,
    super.addresses,
    required ProfileOrderHistoryModel super.orderHistory,
    super.inProgressOrders,
    super.orderNotifications,
    required ProfileSettingsModel super.settings,
    super.wishlist,
  });

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) {
    return ProfileDataModel(
      me: ProfileUserModel.fromJson(json['me'] ?? {}),
      addresses: List<dynamic>.from(json['addresses'] ?? const []),
      orderHistory: ProfileOrderHistoryModel.fromJson(
        json['order_history'] ?? {},
      ),
      inProgressOrders: List<dynamic>.from(
        json['in_progress_orders'] ?? const [],
      ),
      orderNotifications: List<dynamic>.from(
        json['order_notifications'] ?? const [],
      ),
      settings: ProfileSettingsModel.fromJson(json['settings'] ?? {}),
      wishlist: List<dynamic>.from(json['wishlist'] ?? const []),
    );
  }
}

class ProfileUserModel extends ProfileUserEntity {
  ProfileUserModel({
    required super.id,
    super.profilePicture,
    super.name,
    required super.username,
    super.firstname,
    super.lastname,
    super.gender,
    super.birthday,
    required super.email,
    required super.phone,
    required super.countryCode,
    required super.emailVerified,
    required super.phoneVerified,
    super.preferredLanguages,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ProfileUserModel.fromJson(Map<String, dynamic> json) {
    return ProfileUserModel(
      id: json['id'] ?? 0,
      profilePicture: json['profile_picture'],
      name: json['name'],
      username: json['username'] ?? '',
      firstname: json['firstname'],
      lastname: json['lastname'],
      gender: json['gender'],
      birthday: json['birthday'],
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      countryCode: json['country_code'] ?? '',
      emailVerified: json['email_verified'] ?? false,
      phoneVerified: json['phone_verified'] ?? false,
      preferredLanguages: List<dynamic>.from(
        json['preferred_languages'] ?? const [],
      ),
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

class ProfileOrderHistoryModel extends ProfileOrderHistoryEntity {
  ProfileOrderHistoryModel({super.orders, super.orderedAt});

  factory ProfileOrderHistoryModel.fromJson(Map<String, dynamic> json) {
    return ProfileOrderHistoryModel(
      orders: List<dynamic>.from(json['orders'] ?? const []),
      orderedAt: List<dynamic>.from(json['ordered_at'] ?? const []),
    );
  }
}

class ProfileSettingsModel extends ProfileSettingsEntity {
  ProfileSettingsModel({
    required ProfilePrivacyAndSecurityModel super.privacyAndSecurity,
  });

  factory ProfileSettingsModel.fromJson(Map<String, dynamic> json) {
    return ProfileSettingsModel(
      privacyAndSecurity: ProfilePrivacyAndSecurityModel.fromJson(
        json['privacy_and_security'] ?? {},
      ),
    );
  }
}

class ProfilePrivacyAndSecurityModel extends ProfilePrivacyAndSecurityEntity {
  ProfilePrivacyAndSecurityModel({
    super.activeSessions,
    required ProfileAvailabilityModel super.changePassword,
    required ProfileAvailabilityModel super.changeUsername,
  });

  factory ProfilePrivacyAndSecurityModel.fromJson(Map<String, dynamic> json) {
    return ProfilePrivacyAndSecurityModel(
      activeSessions: (json['active_sessions'] as List<dynamic>? ?? const [])
          .map((session) => ActiveSessionModel.fromJson(session))
          .toList(),
      changePassword: ProfileAvailabilityModel.fromJson(
        json['change_password'] ?? {},
      ),
      changeUsername: ProfileAvailabilityModel.fromJson(
        json['change_username'] ?? {},
      ),
    );
  }
}

class ActiveSessionModel extends ActiveSessionEntity {
  ActiveSessionModel({
    required super.id,
    required super.name,
    required super.lastUsedAt,
    required super.isCurrent,
  });

  factory ActiveSessionModel.fromJson(Map<String, dynamic> json) {
    return ActiveSessionModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      lastUsedAt: json['last_used_at'] ?? '',
      isCurrent: json['is_current'] ?? false,
    );
  }
}

class ProfileAvailabilityModel extends ProfileAvailabilityEntity {
  ProfileAvailabilityModel({required super.available});

  factory ProfileAvailabilityModel.fromJson(Map<String, dynamic> json) {
    return ProfileAvailabilityModel(available: json['available'] ?? false);
  }
}
