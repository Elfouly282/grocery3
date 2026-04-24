import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppStyles {
  static const TextStyle font24Bold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle font22Bold = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle font22BoldBlack87 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const TextStyle font22SemiBoldDeepBlue = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static const TextStyle font16Medium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static const TextStyle font14MediumWhite = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static const TextStyle font14MediumGrey500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFF9E9E9E),
  );

  static const TextStyle font14MediumBlack87 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  static const TextStyle font14RegularGrey = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
  );

  static const TextStyle font14RegularGreyHeight150 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
    height: 1.5,
  );

  static const TextStyle font14Regular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: AppFonts.mainFont,
    color: AppColors.black,
  );

  static const TextStyle font13RegularDeepBlue = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: AppColors.primary,
  );

  static const TextStyle font13RegularGrey400 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: Color(0xFFBDBDBD),
  );

  static const TextStyle font12RegularRedAccent = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.redAccent,
  );
}
