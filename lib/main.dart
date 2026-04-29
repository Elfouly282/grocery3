import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grocery3/core/bloc_observer/bloc_observer.dart';
import 'package:grocery3/core/helper/cache/cache_helper.dart';
import 'package:grocery3/core/utils/get_it_server_locator.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/features/home/presentation/screens/home_view.dart';
import 'package:grocery3/features/onboarding/screens/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(Grocery3());
}

class Grocery3 extends StatelessWidget {
  const Grocery3({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ScreenUtilInit(
        designSize: Size(402, 874),
        minTextAdapt: true,
        splitScreenMode: true,
        child: OnBoardingScreen(),
      ),
    );
  }
}