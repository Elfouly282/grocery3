import 'package:flutter/material.dart';

class CustomTextSearchField extends StatelessWidget {
  final String? hintText;

  final void Function(String) onchanged;
  final Color? filledColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;

  const CustomTextSearchField({
    super.key,
    this.hintStyle,
    this.suffixIcon,
    this.filledColor,
    required this.onchanged,
    this.hintText,

    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onchanged,

      decoration: InputDecoration(
        filled: true,

        hintStyle: hintStyle,
        counterText: "",
        fillColor: filledColor,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: _buildOutlineInputBorder(),
        enabledBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: Color(0xffE6E9E9)),
    );
  }
}
