import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/product_details/presentation/screens/product_details_screen.dart';
import '../../features/product_details/presentation/screens/product_list_screen.dart';
import '../../features/smart_lists/presentation/screens/smart_lists_screen.dart';
import '../../features/layout/presentation/screens/cart_screen.dart';

part 'app_router.gr.dart'; // generated file

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ProductListRoute.page, initial: true),
        AutoRoute(page: ProductDetailsRoute.page),
        AutoRoute(page: SmartListsRoute.page),
        AutoRoute(page: CartRoute.page),
      ];
}
