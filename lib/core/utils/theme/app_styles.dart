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
              color:  Color(0xFF000015) /* Color-black */,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            );
  static const TextStyle font16Regular = TextStyle(
              color:  Color(0xFF000015) /* Color-black */,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            );

  static const TextStyle font14RegularGrey = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
  );

  
  
}