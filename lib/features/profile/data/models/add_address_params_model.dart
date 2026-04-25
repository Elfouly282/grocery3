import 'package:grocery3/features/profile/domain/entities/add_address_params_entity.dart';

class AddAddressParamsModel extends AddAddressParamsEntity {
  const AddAddressParamsModel({
    required super.fullName,
    required super.phone,
    required super.streetAddress,
    required super.city,
  });

  factory AddAddressParamsModel.fromEntity(AddAddressParamsEntity entity) {
    return AddAddressParamsModel(
      fullName: entity.fullName,
      phone: entity.phone,
      streetAddress: entity.streetAddress,
      city: entity.city,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'phone': phone,
      'street_address': streetAddress,
      'city': city,
    };
  }
}
