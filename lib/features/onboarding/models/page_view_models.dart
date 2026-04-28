import 'package:flutter/material.dart';
import 'package:grocery3/core/constants/app_assets.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_fonts.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/login/presentation/screens/login_view.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel> pagesViewModel(BuildContext context) {
  return [
    getCustomPageViewModel(
      title: "Shop Everything You Need, In One Click",
      imagePath: Assets.assetsOnboarding1,
      body:
          " Discover over 1000 fresh and essential grocery products in a single place.",
      context: context,
    ),
    getCustomPageViewModel(
      title: "Save Time, Get Groceries Delivered to Your Door",
      imagePath: Assets.assetsOnboarding2,
      body: "Ultra-fast delivery with real-time tracking straight to you.",
      context: context,
    ),
  ];
}

PageViewModel getCustomPageViewModel({
  required String title,
  required String body,
  required String imagePath,
  required BuildContext context,
}) {
  return PageViewModel(
    decoration: const PageDecoration(imageFlex: 8, bodyFlex: 5),
    image: Stack(
      children: [
        // Container(
        //   width: double.infinity,
        //   decoration: const BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage("assets/images/on_boarding_bg.png"),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        Align(
          alignment: AlignmentGeometry.bottomCenter,
          child: Image.asset(imagePath, height: 252, fit: BoxFit.cover),
        ),
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              );
            },
            child: Text(
              "Skip",
              style: AppStyles.font16Medium.copyWith(color: AppColors.darkBlue),
            ),
          ),
        ),
      ],
    ),
    titleWidget: Text(
      title,
      textAlign: TextAlign.center,
      style: AppStyles.font16SemiBold,
    ),
    bodyWidget: Text(
      body,
      textAlign: TextAlign.center,
      style: AppStyles.font14Regular.copyWith(fontFamily: AppFonts.interFont),
    ),
  );
}
