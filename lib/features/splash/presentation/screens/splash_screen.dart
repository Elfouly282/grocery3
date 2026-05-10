import 'package:auto_route/auto_route.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grocery3/core/constants/app_constants.dart';
import 'package:grocery3/core/routes/app_router.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() {
    Timer(const Duration(seconds: AppConstants.splashDelay), () {
      if (mounted) {
        context.router.replace(const OnBoardingScreenRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash.png',
              width: 200,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
