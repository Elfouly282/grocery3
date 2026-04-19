import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppStyles {
  static const TextStyle font24Bold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  static const TextStyle font18Bold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontFamily: AppFonts.interFont,
  );
  static const TextStyle font12Regular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
    fontFamily: AppFonts.interFont,
  );

  static const TextStyle font16Medium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: AppFonts.interFont,
  );

  static const TextStyle font14RegularGrey = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
  );

  static const TextStyle font14Regular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: AppFonts.mainFont,
    color: AppColors.black,
  );
}
