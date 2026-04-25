class AddressEntity {
  final int id;
  final String? label;
  final String? fullName;
  final String? phone;
  final String? countryCode;
  final String? formattedPhone;
  final String? streetAddress;
  final String? buildingNumber;
  final String? floor;
  final String? apartment;
  final String? landmark;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;
  final String? notes;
  final bool isDefault;
  final String? latitude;
  final String? longitude;
  final String? fullAddress;
  final String? createdAt;
  final String? updatedAt;

  const AddressEntity({
    required this.id,
    this.label,
    this.fullName,
    this.phone,
    this.countryCode,
    this.formattedPhone,
    this.streetAddress,
    this.buildingNumber,
    this.floor,
    this.apartment,
    this.landmark,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.notes,
    required this.isDefault,
    this.latitude,
    this.longitude,
    this.fullAddress,
    this.createdAt,
    this.updatedAt,
  });
}
