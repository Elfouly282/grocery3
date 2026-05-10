// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CartScreen]
class CartScreenRoute extends PageRouteInfo<void> {
  const CartScreenRoute({List<PageRouteInfo>? children})
    : super(CartScreenRoute.name, initialChildren: children);

  static const String name = 'CartScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CartScreen();
    },
  );
}

/// generated route for
/// [FavoritesScreen]
class FavoritesScreenRoute extends PageRouteInfo<void> {
  const FavoritesScreenRoute({List<PageRouteInfo>? children})
    : super(FavoritesScreenRoute.name, initialChildren: children);

  static const String name = 'FavoritesScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavoritesScreen();
    },
  );
}

/// generated route for
/// [LoginView]
class LoginViewRoute extends PageRouteInfo<void> {
  const LoginViewRoute({List<PageRouteInfo>? children})
    : super(LoginViewRoute.name, initialChildren: children);

  static const String name = 'LoginViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginView();
    },
  );
}

/// generated route for
/// [MainScreen]
class MainScreenRoute extends PageRouteInfo<void> {
  const MainScreenRoute({List<PageRouteInfo>? children})
    : super(MainScreenRoute.name, initialChildren: children);

  static const String name = 'MainScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [MyCardsScreen]
class MyCardsScreenRoute extends PageRouteInfo<void> {
  const MyCardsScreenRoute({List<PageRouteInfo>? children})
    : super(MyCardsScreenRoute.name, initialChildren: children);

  static const String name = 'MyCardsScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyCardsScreen();
    },
  );
}

/// generated route for
/// [OnBoardingScreen]
class OnBoardingScreenRoute extends PageRouteInfo<void> {
  const OnBoardingScreenRoute({List<PageRouteInfo>? children})
    : super(OnBoardingScreenRoute.name, initialChildren: children);

  static const String name = 'OnBoardingScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnBoardingScreen();
    },
  );
}

/// generated route for
/// [OrdersScreen]
class OrdersScreenRoute extends PageRouteInfo<void> {
  const OrdersScreenRoute({List<PageRouteInfo>? children})
    : super(OrdersScreenRoute.name, initialChildren: children);

  static const String name = 'OrdersScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OrdersScreen();
    },
  );
}

/// generated route for
/// [ProductDetailsScreen]
class ProductDetailsScreenRoute
    extends PageRouteInfo<ProductDetailsScreenRouteArgs> {
  ProductDetailsScreenRoute({
    Key? key,
    required int productId,
    List<PageRouteInfo>? children,
  }) : super(
         ProductDetailsScreenRoute.name,
         args: ProductDetailsScreenRouteArgs(key: key, productId: productId),
         initialChildren: children,
       );

  static const String name = 'ProductDetailsScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsScreenRouteArgs>();
      return ProductDetailsScreen(key: args.key, productId: args.productId);
    },
  );
}

class ProductDetailsScreenRouteArgs {
  const ProductDetailsScreenRouteArgs({this.key, required this.productId});

  final Key? key;

  final int productId;

  @override
  String toString() {
    return 'ProductDetailsScreenRouteArgs{key: $key, productId: $productId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDetailsScreenRouteArgs) return false;
    return key == other.key && productId == other.productId;
  }

  @override
  int get hashCode => key.hashCode ^ productId.hashCode;
}

/// generated route for
/// [ProductListScreen]
class ProductListScreenRoute extends PageRouteInfo<void> {
  const ProductListScreenRoute({List<PageRouteInfo>? children})
    : super(ProductListScreenRoute.name, initialChildren: children);

  static const String name = 'ProductListScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProductListScreen();
    },
  );
}

/// generated route for
/// [SmartListDetailsScreen]
class SmartListDetailsScreenRoute
    extends PageRouteInfo<SmartListDetailsScreenRouteArgs> {
  SmartListDetailsScreenRoute({
    Key? key,
    required int listId,
    List<PageRouteInfo>? children,
  }) : super(
         SmartListDetailsScreenRoute.name,
         args: SmartListDetailsScreenRouteArgs(key: key, listId: listId),
         initialChildren: children,
       );

  static const String name = 'SmartListDetailsScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SmartListDetailsScreenRouteArgs>();
      return SmartListDetailsScreen(key: args.key, listId: args.listId);
    },
  );
}

class SmartListDetailsScreenRouteArgs {
  const SmartListDetailsScreenRouteArgs({this.key, required this.listId});

  final Key? key;

  final int listId;

  @override
  String toString() {
    return 'SmartListDetailsScreenRouteArgs{key: $key, listId: $listId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SmartListDetailsScreenRouteArgs) return false;
    return key == other.key && listId == other.listId;
  }

  @override
  int get hashCode => key.hashCode ^ listId.hashCode;
}

/// generated route for
/// [SmartListsScreen]
class SmartListsScreenRoute extends PageRouteInfo<void> {
  const SmartListsScreenRoute({List<PageRouteInfo>? children})
    : super(SmartListsScreenRoute.name, initialChildren: children);

  static const String name = 'SmartListsScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SmartListsScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute({List<PageRouteInfo>? children})
    : super(SplashScreenRoute.name, initialChildren: children);

  static const String name = 'SplashScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}
