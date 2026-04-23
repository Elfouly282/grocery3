import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'injection_container.dart' as di;
import 'core/bloc_observer/bloc_observer.dart';
import 'features/product_details/presentation/bloc/product_bloc.dart';
import 'features/favorites/presentation/bloc/favorites_bloc.dart';
import 'features/orders/presentation/bloc/orders_bloc.dart';
import 'features/smart_lists/presentation/bloc/smart_lists_bloc.dart';
import 'features/cards/presentation/bloc/cards_bloc.dart';
import 'features/layout/presentation/cubit/layout_cubit.dart';
import 'package:grocery3/core/routes/app_router.dart';
import 'core/utils/theme/app_colors.dart';
import 'core/helper/cache/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => di.sl<ProductBloc>()),
            BlocProvider(create: (context) => di.sl<LayoutCubit>()),
            BlocProvider(create: (context) => di.sl<FavoritesBloc>()),
            BlocProvider(create: (context) => di.sl<OrdersBloc>()),
            BlocProvider(create: (context) => di.sl<SmartListsBloc>()),
            BlocProvider(create: (context) => di.sl<CardsBloc>()),
          ],
          child: MaterialApp.router(
            routerConfig: _appRouter.config(),
            debugShowCheckedModeBanner: false,
            title: 'Grocery App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
              useMaterial3: true,
              scaffoldBackgroundColor: AppColors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.appBarBackground,
                elevation: 0,
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                  color: Color(0xFF1F2937),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
