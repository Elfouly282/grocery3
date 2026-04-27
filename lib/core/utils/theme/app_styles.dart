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

  static const TextStyle font14Regular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: AppFonts.mainFont,
    color: AppColors.black,
  );
  static const TextStyle font12Regular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: AppFonts.mainFont,
    color: AppColors.black,
  );

  // Checkout Styles
  static const TextStyle checkoutSectionTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const TextStyle checkoutPrimaryBody = TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static const TextStyle checkoutPrimaryBodySemiBold = TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const TextStyle checkoutLocationLabel = TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontFamily: AppFonts.mainFont,
  );

  static const TextStyle checkoutPrimaryBodyBold = TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static const TextStyle checkoutHintText = TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static const TextStyle checkoutButtonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3,
    color: AppColors.white,
  );

  static const TextStyle checkoutBadgeText = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle checkoutMiniBadgeText = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle checkoutCardBrandText = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w800,
    color: AppColors.white,
  );

  static const TextStyle checkoutCardBrandSmallText = TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.w800,
    color: AppColors.white,
  );

  static const TextStyle font16BoldPrimary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle font12RegularLineThrough = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: AppFonts.mainFont,
    color: AppColors.black,
  );

  static const TextStyle font18SemdiBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.interFont,
    color: AppColors.black,
  );

  static const TextStyle font16Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: AppFonts.interFont,
    color: AppColors.white,
  );
}
