class UpdateProfileEntity {
  final int? id;
  final String? imgPath;

  final String? name;
  final String? email;
  final String? phone;
  final String? countryCode;
  final String? firstname;
  final String? lastname;
  final String? gender;
  final String? birthday;
  final String? lang;


  const UpdateProfileEntity({
    this.id,
    this.imgPath,
    this.name,
    this.email,
    this.phone,
    this.countryCode,
    this.firstname,
    this.lastname,
    this.gender,
    this.birthday, this.lang,
  });
}
