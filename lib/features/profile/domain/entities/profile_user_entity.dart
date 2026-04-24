


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
  ProfileUserEntity copyWith({
    int? id,
    String? profilePicture,
    String? name,
    String? username,
    String? firstname,
    String? lastname,
    String? gender,
    String? birthday,
    String? email,
    String? phone,
    String? countryCode,
    bool? emailVerified,
    bool? phoneVerified,
    List<dynamic>? preferredLanguages,
    String? createdAt,
    String? updatedAt,
  }) {
    return ProfileUserEntity(
      id: id ?? this.id,
      profilePicture: profilePicture ?? this.profilePicture,
      name: name ?? this.name,
      username: username ?? this.username,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
      emailVerified: emailVerified ?? this.emailVerified,
      phoneVerified: phoneVerified ?? this.phoneVerified,
      preferredLanguages: preferredLanguages ?? this.preferredLanguages,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
