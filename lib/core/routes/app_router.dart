import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grocery3/features/layout/presentation/screens/main_screen.dart';
import 'package:grocery3/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:grocery3/features/smart_lists/presentation/screens/smart_lists_screen.dart';
import 'package:grocery3/features/smart_lists/presentation/screens/smart_list_details_screen.dart';
import 'package:grocery3/features/orders/presentation/screens/orders_screen.dart';
import 'package:grocery3/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:grocery3/features/cards/presentation/screens/my_cards_screen.dart';
import 'package:grocery3/features/layout/presentation/screens/product_list_screen.dart';
import 'package:grocery3/features/orders/presentation/screens/cart_screen.dart';
import 'package:grocery3/features/splash/presentation/screens/splash_screen.dart';
import 'package:grocery3/features/onboarding/screens/on_boarding_screen.dart';
import 'package:grocery3/features/login/presentation/screens/login_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashScreenRoute.page, initial: true),
        AutoRoute(page: OnBoardingScreenRoute.page),
        AutoRoute(page: MainScreenRoute.page),
        AutoRoute(page: ProductDetailsScreenRoute.page),
        AutoRoute(page: SmartListsScreenRoute.page),
        AutoRoute(page: SmartListDetailsScreenRoute.page),
        AutoRoute(page: OrdersScreenRoute.page),
        AutoRoute(page: FavoritesScreenRoute.page),
        AutoRoute(page: MyCardsScreenRoute.page),
        AutoRoute(page: ProductListScreenRoute.page),
        AutoRoute(page: CartScreenRoute.page),
        AutoRoute(page: LoginViewRoute.page),
      ];
}
