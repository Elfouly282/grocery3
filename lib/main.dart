import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery3/core/bloc_observer/bloc_observer.dart';
import 'package:grocery3/core/helper/cache/cache_helper.dart';
import 'package:grocery3/core/utils/get_it_server_locator.dart';
import 'package:grocery3/features/auth/presentation/sign_up_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const Grocery3());
}

class Grocery3 extends StatelessWidget {
  const Grocery3({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        designSize: Size(402, 874),
        minTextAdapt: true,
        splitScreenMode: true,
        child: SignUpView(),
      ),
    );
  }
}
