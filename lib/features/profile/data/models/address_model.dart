import 'package:grocery3/features/profile/domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  const AddressModel({
    required super.id,
    super.label,
    super.fullName,
    super.phone,
    super.countryCode,
    super.formattedPhone,
    super.streetAddress,
    super.buildingNumber,
    super.floor,
    super.apartment,
    super.landmark,
    super.city,
    super.state,
    super.postalCode,
    super.country,
    super.notes,
    required super.isDefault,
    super.latitude,
    super.longitude,
    super.fullAddress,
    super.createdAt,
    super.updatedAt,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      label: json['label'],
      fullName: json['full_name'],
      phone: json['phone'],
      countryCode: json['country_code'],
      formattedPhone: json['formatted_phone'],
      streetAddress: json['street_address'],
      buildingNumber: json['building_number'],
      floor: json['floor'],
      apartment: json['apartment'],
      landmark: json['landmark'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postal_code'],
      country: json['country'],
      notes: json['notes'],
      isDefault: json['is_default'] ?? false,
      latitude: json['latitude']?.toString(),
      longitude: json['longitude']?.toString(),
      fullAddress: json['full_address'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
