import 'package:flutter/material.dart';
import 'package:grocery3/features/onboarding/screens/on_boarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;
import 'features/product_details/presentation/bloc/product_bloc.dart';
import 'features/product_details/presentation/screens/product_details_screen.dart';

import 'core/helper/cache/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: OnBoardingScreen(),
    );
  }
}
