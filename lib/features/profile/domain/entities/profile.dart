class ProfileEntity {
  final bool success;
  final String message;
  final ProfileDataEntity data;

  ProfileEntity({
    required this.success,
    required this.message,
    required this.data,
  });
}

class ProfileDataEntity {
  final ProfileUserEntity me;
  final List<dynamic> addresses;
  final ProfileOrderHistoryEntity orderHistory;
  final List<dynamic> inProgressOrders;
  final List<dynamic> orderNotifications;
  final ProfileSettingsEntity settings;
  final List<dynamic> wishlist;

  ProfileDataEntity({
    required this.me,
    this.addresses = const [],
    required this.orderHistory,
    this.inProgressOrders = const [],
    this.orderNotifications = const [],
    required this.settings,
    this.wishlist = const [],
  });
}

class ProfileUserEntity {
  final int id;
  final String? profilePicture;
  final String? name;
  final String username;
  final String? firstname;
  final String? lastname;
  final String? gender;
  final String? birthday;
  final String email;
  final String phone;
  final String countryCode;
  final bool emailVerified;
  final bool phoneVerified;
  final List<dynamic> preferredLanguages;
  final String createdAt;
  final String updatedAt;

  ProfileUserEntity({
    required this.id,
    this.profilePicture,
    this.name,
    required this.username,
    this.firstname,
    this.lastname,
    this.gender,
    this.birthday,
    required this.email,
    required this.phone,
    required this.countryCode,
    required this.emailVerified,
    required this.phoneVerified,
    this.preferredLanguages = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  String get displayName {
    if ((name ?? '').trim().isNotEmpty) {
      return name!.trim();
    }

    final parts = [firstname, lastname]
        .where((part) => (part ?? '').trim().isNotEmpty)
        .join(' ')
        .trim();

    if (parts.isNotEmpty) {
      return parts;
    }

    return username;
  }
}

class ProfileOrderHistoryEntity {
  final List<dynamic> orders;
  final List<dynamic> orderedAt;

  ProfileOrderHistoryEntity({
    this.orders = const [],
    this.orderedAt = const [],
  });
}

class ProfileSettingsEntity {
  final ProfilePrivacyAndSecurityEntity privacyAndSecurity;

  ProfileSettingsEntity({required this.privacyAndSecurity});
}

class ProfilePrivacyAndSecurityEntity {
  final List<ActiveSessionEntity> activeSessions;
  final ProfileAvailabilityEntity changePassword;
  final ProfileAvailabilityEntity changeUsername;

  ProfilePrivacyAndSecurityEntity({
    this.activeSessions = const [],
    required this.changePassword,
    required this.changeUsername,
  });
}

class ActiveSessionEntity {
  final int id;
  final String name;
  final String lastUsedAt;
  final bool isCurrent;

  ActiveSessionEntity({
    required this.id,
    required this.name,
    required this.lastUsedAt,
    required this.isCurrent,
  });
}

class ProfileAvailabilityEntity {
  final bool available;

  ProfileAvailabilityEntity({required this.available});
}
