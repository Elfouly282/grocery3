import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/theme/app_colors.dart';

class CustomPasswordField extends StatefulWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  // final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;

  const CustomPasswordField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    // this.isObscureText ,
    this.controller,
    // this.validator,
    this.keyboardType,
    this.onSaved,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      controller: widget.controller,
      obscureText: isObscureText,
      keyboardType: widget.keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        constraints: BoxConstraints(maxHeight: 42.h, minHeight: 42.h),
        contentPadding: EdgeInsets.zero,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: const Color(0xFF878787) /* Color-gray */,
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isObscureText = !isObscureText;
            });
          },
          child:
              isObscureText
                  ? const Icon(
                    Icons.visibility_off_rounded,
                    size: 20,
                    color: Color(0xFF878787) /* Color-gray */,
                  )
                  : const Icon(
                    Icons.visibility_rounded,
                    size: 20,
                    color: Color(0xFF878787) /* Color-gray */,
                  ),
        ),
        filled: true,
        fillColor: AppColors.white,
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(AppColors.primary),
        errorBorder: outlineInputBorder(AppColors.error),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),

      borderSide: BorderSide(
        width: 0.50,

        color: const Color(0xFF878787) /* Color-gray */,
      ),
    );
  }
}
