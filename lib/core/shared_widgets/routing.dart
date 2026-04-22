import 'package:flutter/material.dart';
import 'package:grocery3/features/login/presentation/screens/login_view.dart';
import 'package:grocery3/features/onboarding/screens/on_boarding_screen.dart';

Route onGenerateRoute(RouteSettings settings) => MaterialPageRoute(
  builder: (context) {
    if (settings.name == '/') {
      return OnBoardingScreen();
    } else if (settings.name == LoginView.loginid) {
      return LoginView();
    // } else if (settings.name == '/productDetails') {
    //   return ProductDetailsScreen();
    // } else if (settings.name == '/categories') {
    //   return CategoriesView();
    // } else if (settings.name == '/signUp') {
    //   return SignUpView();
    } else {
      return Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      );
    }
  },
);
