import 'package:flutter/material.dart';
import 'package:grocery3/features/onboarding/screens/on_boarding_screen.dart';

Route onGenerateRoute(RouteSettings settings) => MaterialPageRoute(
  builder: (context) {
    switch (settings.name) {
      case '/':
        return OnBoardingScreen();
      // case '/home':
      //   return HomeScreen();
      // case '/productDetails':
      //   return ProductDetailsScreen();
      // case '/categories':
      //   return CategoriesView();
      // case '/signUp':
      //   return SignUpView();
      default:
        return Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        );
    }
  },
);
