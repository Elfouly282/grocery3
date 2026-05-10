import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_fonts.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:introduction_screen/introduction_screen.dart';

final List<PageViewModel> pagesViewModel = [
  getCustomPageViewModel(
    title: "Shop Everything You Need, In One Click",
    imagePath: "assets/images/onboarding_1.png",
    body:
        " Discover over 1000 fresh and essential grocery products in a single place.",
  ),
  getCustomPageViewModel(
    title: "Save Time, Get Groceries Delivered to Your Door",
    imagePath: "assets/images/onboarding_2.png",
    body: "Ultra-fast delivery with real-time tracking straight to you.",
  ),
];

PageViewModel getCustomPageViewModel({
  required String title,
  required String body,
  required String imagePath,
}) {
  return PageViewModel(
    decoration: const PageDecoration(imageFlex: 8, bodyFlex: 5),
    image: Align(
      alignment: AlignmentGeometry.bottomCenter,
      child: Image.asset(imagePath, height: 252, fit: BoxFit.cover),
    ),
    titleWidget: Text(
      title,
      textAlign: TextAlign.center,
      style: AppStyles.font18SemdiBold,
    ),
    bodyWidget: Text(
      body,
      textAlign: TextAlign.center,
      style: AppStyles.font14Regular.copyWith(fontFamily: AppFonts.interFont),
    ),
  );
}
