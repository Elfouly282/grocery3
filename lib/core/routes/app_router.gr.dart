// // dart format width=80
// // GENERATED CODE - DO NOT MODIFY BY HAND

// // **************************************************************************
// // AutoRouterGenerator
// // **************************************************************************

// // ignore_for_file: type=lint
// // coverage:ignore-file

// part of 'app_router.dart';

// /// generated route for
// /// [CartScreen]
// class CartRoute extends PageRouteInfo<void> {
//   const CartRoute({List<PageRouteInfo>? children})
//     : super(CartRoute.name, initialChildren: children);

//   static const String name = 'CartRoute';

//   static PageInfo page = PageInfo(
//     name,
//     builder: (data) {
//       return const CartScreen();
//     },
//   );
// }

// /// generated route for
// /// [FavoritesScreen]
// class FavoritesRoute extends PageRouteInfo<void> {
//   const FavoritesRoute({List<PageRouteInfo>? children})
//     : super(FavoritesRoute.name, initialChildren: children);

//   static const String name = 'FavoritesRoute';

//   static PageInfo page = PageInfo(
//     name,
//     builder: (data) {
//       return const FavoritesScreen();
//     },
//   );
// }

// /// generated route for
// /// [MainScreen]
// class MainRoute extends PageRouteInfo<void> {
//   const MainRoute({List<PageRouteInfo>? children})
//     : super(MainRoute.name, initialChildren: children);

//   static const String name = 'MainRoute';

//   static PageInfo page = PageInfo(
//     name,
//     builder: (data) {
//       return const MainScreen();
//     },
//   );
// }

// /// generated route for
// /// [MyCardsScreen]
// class MyCardsRoute extends PageRouteInfo<void> {
//   const MyCardsRoute({List<PageRouteInfo>? children})
//     : super(MyCardsRoute.name, initialChildren: children);

//   static const String name = 'MyCardsRoute';

//   static PageInfo page = PageInfo(
//     name,
//     builder: (data) {
//       return const MyCardsScreen();
//     },
//   );
// }

// /// generated route for
// /// [OrdersScreen]
// class OrdersRoute extends PageRouteInfo<void> {
//   const OrdersRoute({List<PageRouteInfo>? children})
//     : super(OrdersRoute.name, initialChildren: children);

//   static const String name = 'OrdersRoute';

//   static PageInfo page = PageInfo(
//     name,
//     builder: (data) {
//       return const OrdersScreen();
//     },
//   );
// }

// /// generated route for
// /// [ProductDetailsScreen]
// class ProductDetailsRoute extends PageRouteInfo<ProductDetailsRouteArgs> {
//   ProductDetailsRoute({
//     Key? key,
//     required int productId,
//     List<PageRouteInfo>? children,
//   }) : super(
//          ProductDetailsRoute.name,
//          args: ProductDetailsRouteArgs(key: key, productId: productId),
//          initialChildren: children,
//        );

//   static const String name = 'ProductDetailsRoute';

//   static PageInfo page = PageInfo(
//     name,
//     builder: (data) {
//       final args = data.argsAs<ProductDetailsRouteArgs>();
//       return ProductDetailsScreen(key: args.key, productId: args.productId);
//     },
//   );
// }

// class ProductDetailsRouteArgs {
//   const ProductDetailsRouteArgs({this.key, required this.productId});

//   final Key? key;

//   final int productId;

//   @override
//   String toString() {
//     return 'ProductDetailsRouteArgs{key: $key, productId: $productId}';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     if (other is! ProductDetailsRouteArgs) return false;
//     return key == other.key && productId == other.productId;
//   }

//   @override
//   int get hashCode => key.hashCode ^ productId.hashCode;
// }

// /// generated route for
// /// [ProductListScreen]
// class ProductListRoute extends PageRouteInfo<void> {
//   const ProductListRoute({List<PageRouteInfo>? children})
//     : super(ProductListRoute.name, initialChildren: children);

//   static const String name = 'ProductListRoute';

//   static PageInfo page = PageInfo(
//     name,
//     builder: (data) {
//       return const ProductListScreen();
//     },
//   );
// }

// /// generated route for
// /// [SmartListDetailsScreen]
// class SmartListDetailsRoute extends PageRouteInfo<SmartListDetailsRouteArgs> {
//   SmartListDetailsRoute({
//     Key? key,
//     required int listId,
//     List<PageRouteInfo>? children,
//   }) : super(
//          SmartListDetailsRoute.name,
//          args: SmartListDetailsRouteArgs(key: key, listId: listId),
//          initialChildren: children,
//        );

//   static const String name = 'SmartListDetailsRoute';

//   static PageInfo page = PageInfo(
//     name,
//     builder: (data) {
//       final args = data.argsAs<SmartListDetailsRouteArgs>();
//       return SmartListDetailsScreen(key: args.key, listId: args.listId);
//     },
//   );
// }

// class SmartListDetailsRouteArgs {
//   const SmartListDetailsRouteArgs({this.key, required this.listId});

//   final Key? key;

//   final int listId;

//   @override
//   String toString() {
//     return 'SmartListDetailsRouteArgs{key: $key, listId: $listId}';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     if (other is! SmartListDetailsRouteArgs) return false;
//     return key == other.key && listId == other.listId;
//   }

//   @override
//   int get hashCode => key.hashCode ^ listId.hashCode;
// }

// /// generated route for
// /// [SmartListsScreen]
// class SmartListsRoute extends PageRouteInfo<void> {
//   const SmartListsRoute({List<PageRouteInfo>? children})
//     : super(SmartListsRoute.name, initialChildren: children);

//   static const String name = 'SmartListsRoute';

//   static PageInfo page = PageInfo(
//     name,
//     builder: (data) {
//       return const SmartListsScreen();
//     },
//   );
// }
