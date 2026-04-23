import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;




  final void Function(String?)? onSaved;
  final void Function(String?)? onchanged;
  final Color? filledColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;

  const CustomTextFormField({
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
    return TextFormField(

       onSaved: onSaved,
      onChanged: onchanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "هذا الحقل مطلوب";
        }
        return null;
      },
      maxLength: 40,


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
