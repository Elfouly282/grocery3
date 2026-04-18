import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_fonts.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:introduction_screen/introduction_screen.dart';

final List<PageViewModel> pagesViewModel = [
  getCustomPageViewModel(
    title: "Shop Everything You Need, In One Click",
    imagePath: "assets/images/on_boarding_1.png",
    body:
        " Discover over 1000 fresh and essential grocery products in a single place.",
  ),
  getCustomPageViewModel(
    title: "Save Time, Get Groceries Delivered to Your Door",
    imagePath: "assets/images/on_boarding_2.png",
    body: "Ultra-fast delivery with real-time tracking straight to you.",
  ),
  getCustomPageViewModel(
    title: "Save Time, Get Groceries Delivered to Your Door",
    imagePath: "assets/images/on_boarding_3.png",
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
    image: Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/on_boarding_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: AlignmentGeometry.bottomCenter,
          child: Image.asset(imagePath, height: 252, fit: BoxFit.cover),
        ),
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: TextButton(
            onPressed: () {
              // navigate to home screen
            },
            child: Text("Skip", style: AppStyles.font16Bold),
          ),
        ),
      ],
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
