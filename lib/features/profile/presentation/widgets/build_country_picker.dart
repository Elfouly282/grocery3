import 'package:flutter/material.dart';

Widget buildCountryPicker({
  required Function()? onTap,
  required String countryCode,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFDDE3EA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Country',
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFF1B4F72),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              Text(
                countryCode,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF1B4F72),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: Color(0xFF1B4F72),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
