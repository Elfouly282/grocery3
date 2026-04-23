// import 'package:dartz/dartz.dart'
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/features/login/presentation/screens/login_view.dart'
    show LoginView;
import 'package:introduction_screen/introduction_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../models/page_view_models.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static String id = 'onboarding_screen';
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final GlobalKey<IntroductionScreenState> introKey =
      GlobalKey<IntroductionScreenState>();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            IntroductionScreen(
              isProgress: false,
              key: introKey,
              pages: pagesViewModel,
              done: Image.asset("assets/images/right_arrow.png"),
              next: Image.asset("assets/images/right_arrow.png"),
              back: Image.asset("assets/images/left_arrow.png"),
              showBackButton: true,
              onChange: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              onDone: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
            ),
            Positioned(
              bottom: 128,
              right: 0,
              left: 0,
              child: DotsIndicator(
                dotsCount: pagesViewModel.length,
                position: currentPage.toDouble(),
                decorator: DotsDecorator(
                  size: const Size.square(12),
                  activeSize: const Size.square(12),
                  activeColor: AppColors.darkBlue,
                  color: Colors.black26,
                  spacing: const EdgeInsets.symmetric(horizontal: 5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
