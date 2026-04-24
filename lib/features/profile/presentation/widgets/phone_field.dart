import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery3/core/shared_widgets/custom_text_form_field.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/features/profile/presentation/widgets/build_country_picker.dart';

class PhoneField extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onCountryCodeChanged;

  const PhoneField({super.key, this.controller, this.onCountryCodeChanged});

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  String _countryCode = '+20';

  @override
  void initState() {
    super.initState();
    if (widget.onCountryCodeChanged != null) {
      widget.onCountryCodeChanged!(_countryCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildCountryPicker(
          onTap: _showCountryPicker,
          countryCode: _countryCode,
        ),
        const SizedBox(width: 10),
        // phone number field
        Expanded(
          child: CustomTextFormField(
            controller: widget.controller,
            hintText: '+20123456789',
            keyboardType: TextInputType.phone,
            prefixIcon: const Icon(
              Icons.phone_outlined,
              color: AppColors.iconColor,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
          ),
        ),
      ],
    );
  }

  void _showCountryPicker() {
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
                  setState(() => _countryCode = code);
                  if (widget.onCountryCodeChanged != null) {
                    widget.onCountryCodeChanged!(code);
                  }
                  Navigator.pop(context);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
