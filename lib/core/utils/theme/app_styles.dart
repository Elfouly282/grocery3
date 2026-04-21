import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppStyles {
  static const TextStyle font24Bold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle font16SemiBold = TextStyle(
    color: Color(0xFF000015) /* Color-black */,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );
  static const TextStyle font16Regular = TextStyle(
    color: Color(0xFF000015) /* Color-black */,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle font16Medium = TextStyle(
    color: Color(0xFF000015) /* Color-black */,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static const TextStyle font14Medium = TextStyle(
    color: Color(0xFF000015) /* Color-black */,
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static const TextStyle font12Regular = TextStyle(
    color: Color(0xFF878787) /* Color-gray */,
    fontSize: 12,
    fontFamily: 'Inter',

    fontWeight: FontWeight.w400,
  );
}
