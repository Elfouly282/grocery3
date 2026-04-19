import 'package:flutter/material.dart';

dynamic showCountryPicker(
  BuildContext context,
  Function(String) onCountrySelected,
) {
  final countries = ['+20', '+1', '+44', '+33', '+49', '+966', '+971'];
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) => ListView(
      shrinkWrap: true,
      children: countries
          .map(
            (code) => ListTile(
              title: Text(code),
              onTap: () {
                onCountrySelected(code);
                Navigator.pop(context);
              },
            ),
          )
          .toList(),
    ),
  );
}
