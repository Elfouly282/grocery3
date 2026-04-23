import 'package:flutter/material.dart';

class CustomTextSearchField extends StatelessWidget {
  final String? hintText;




  final void Function(String?)? onSaved;
  final void Function(String?)? onchanged;
  final Color? filledColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;

  const CustomTextSearchField({
    super.key,
    this.hintStyle,
    this.suffixIcon,
    this.filledColor,
    this.onchanged,
    this.hintText,
    this.onSaved,
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
        fillColor:  filledColor,
        hintText: hintText,
        suffixIcon:suffixIcon ,
        prefixIcon: prefixIcon,
        border: _buildOutlineInputBorder(),
        enabledBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),

      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xffE6E9E9),
      ),
    );
  }
}
