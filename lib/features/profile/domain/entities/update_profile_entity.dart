class UpdateProfileEntity {
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? countryCode;
  final List? preferredLanguages;

  const UpdateProfileEntity({
    this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.countryCode,
    this.preferredLanguages,
  });
}
