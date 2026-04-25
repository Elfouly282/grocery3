import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/domain/entities/address_entity.dart';

class AddressDetailsDialog extends StatelessWidget {
  final AddressEntity address;

  const AddressDetailsDialog({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    final details = _buildDetails();

    return AlertDialog(
      backgroundColor: AppColors.profileBackground,
      title: const Text('Address Details', style: AppStyles.font16Medium),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: details.isEmpty
              ? const [
                  Text(
                    'No address details available',
                    style: AppStyles.font16Medium,
                  ),
                ]
              : details
                    .map(
                      (detail) => _AddressDetailItem(
                        title: detail.key,
                        value: detail.value,
                      ),
                    )
                    .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Close',
            style: AppStyles.font16Medium.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }

  List<MapEntry<String, String>> _buildDetails() {
    final details = <MapEntry<String, String>>[];

    void addStringField(String title, String? value) {
      if (value != null && value.trim().isNotEmpty) {
        details.add(MapEntry(title, value));
      }
    }

    details.add(MapEntry('ID', address.id.toString()));
    addStringField('Label', address.label);
    addStringField('Full Name', address.fullName);
    addStringField('Phone', address.phone);
    addStringField('Country Code', address.countryCode);
    addStringField('Formatted Phone', address.formattedPhone);
    addStringField('Street Address', address.streetAddress);
    addStringField('Building Number', address.buildingNumber);
    addStringField('Floor', address.floor);
    addStringField('Apartment', address.apartment);
    addStringField('Landmark', address.landmark);
    addStringField('City', address.city);
    addStringField('State', address.state);
    addStringField('Postal Code', address.postalCode);
    addStringField('Country', address.country);
    addStringField('Notes', address.notes);
    if (address.isDefault) {
      details.add(const MapEntry('Default', 'Yes'));
    }
    addStringField('Latitude', address.latitude);
    addStringField('Longitude', address.longitude);
    addStringField('Full Address', address.fullAddress);
    addStringField('Created At', address.createdAt);
    addStringField('Updated At', address.updatedAt);

    return details;
  }
}

class _AddressDetailItem extends StatelessWidget {
  final String title;
  final String value;

  const _AddressDetailItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text('$title:', style: AppStyles.addressDetailsLabel),
          ),
          Expanded(child: Text(value, style: AppStyles.addressDetailsValue)),
        ],
      ),
    );
  }
}
