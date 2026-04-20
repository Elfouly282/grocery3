import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/AllSettingsAndDarkMode/presentation/cubit/theme/Theme_Cubit.dart';
import 'package:grocery3/Features/AllSettingsAndDarkMode/presentation/views/allSettings_View.dart';
import 'package:grocery3/Features/Help&Support/presentation/views/Help_And_Support_View.dart';
import 'package:grocery3/Features/notification/presentation/notification_View.dart';
import 'package:grocery3/core/bloc_observer/bloc_observer.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/ dependency_injection/get_it.dart';
import 'core/helper/cache/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper().init();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(BlocProvider(
      create: (context) => ThemeCubit(),
      child: const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit,bool>(
      builder: (context, isDark) =>
       MaterialApp(
        theme:  ThemeData(
          brightness: Brightness.light,

          scaffoldBackgroundColor: const Color(0xffF7FCFF),

          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xffF7FCFF),
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,

          scaffoldBackgroundColor: Colors.black,

          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',


        home: AllsettingsView(),
      ),
    );
  }
}

