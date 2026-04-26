import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/api/dio_consumer.dart';
import 'package:grocery3/features/product_details/data/datasources/product_remote_data_source.dart';
import 'package:grocery3/features/product_details/data/repositories/product_repository_impl.dart';
import 'package:grocery3/features/product_details/domain/repositories/product_repository.dart';
import 'package:grocery3/features/product_details/domain/usecases/get_product_details.dart';
import 'package:grocery3/features/product_details/presentation/bloc/product_bloc.dart';
import 'package:grocery3/features/favorites/data/datasources/favorites_remote_data_source.dart';
import 'package:grocery3/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:grocery3/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:grocery3/features/favorites/domain/usecases/get_favorites.dart';
import 'package:grocery3/features/favorites/domain/usecases/toggle_favorite.dart';
import 'package:grocery3/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:grocery3/features/orders/data/datasources/orders_remote_data_source.dart';
import 'package:grocery3/features/orders/data/repositories/orders_repository_impl.dart';
import 'package:grocery3/features/orders/domain/repositories/orders_repository.dart';
import 'package:grocery3/features/orders/domain/usecases/get_orders.dart';
import 'package:grocery3/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:grocery3/features/smart_lists/data/datasources/smart_lists_remote_data_source.dart';
import 'package:grocery3/features/smart_lists/data/repositories/smart_lists_repository_impl.dart';
import 'package:grocery3/features/smart_lists/domain/repositories/smart_lists_repository.dart';
import 'package:grocery3/features/smart_lists/domain/usecases/get_smart_list_details.dart';
import 'package:grocery3/features/smart_lists/domain/usecases/get_smart_lists.dart';
import 'package:grocery3/features/smart_lists/presentation/bloc/smart_lists_bloc.dart';
import 'package:grocery3/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:grocery3/features/cards/data/datasources/cards_remote_data_source.dart';
import 'package:grocery3/features/cards/data/repositories/cards_repository_impl.dart';
import 'package:grocery3/features/cards/domain/repositories/cards_repository.dart';
import 'package:grocery3/features/cards/domain/usecases/get_cards.dart';
import 'package:grocery3/features/cards/presentation/bloc/cards_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Product Details
  // Bloc
  sl.registerFactory(() => ProductBloc(getProductDetailsUseCase: sl()));

  //! Features - Layout
  // Cubit
  sl.registerFactory(() => LayoutCubit());

  // Use cases
  sl.registerLazySingleton(() => GetProductDetailsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(api: sl()) ,
  );

  //! Features - Favorites
  // Bloc
  sl.registerFactory(
    () => FavoritesBloc(
      getFavoritesUseCase: sl(),
      toggleFavoriteUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetFavoritesUseCase(repository: sl()));
  sl.registerLazySingleton(() => ToggleFavoriteUseCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<FavoritesRemoteDataSource>(
    () => FavoritesRemoteDataSourceImpl(api: sl()),
  );

  //! Features - Orders
  // Bloc
  sl.registerFactory(() => OrdersBloc(getOrdersUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetOrdersUseCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<OrdersRepository>(
    () => OrdersRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<OrdersRemoteDataSource>(
    () => OrdersRemoteDataSourceImpl(api: sl()),
  );

  //! Features - Smart Lists
  // Bloc
  sl.registerFactory(
    () => SmartListsBloc(
      getSmartListsUseCase: sl(),
      getSmartListDetailsUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetSmartListsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetSmartListDetailsUseCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<SmartListsRepository>(
    () => SmartListsRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<SmartListsRemoteDataSource>(
    () => SmartListsRemoteDataSourceImpl(api: sl()),
  );

  //! Features - Cards
  // Bloc
  sl.registerFactory(() => CardsBloc(getCardsUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetCardsUseCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<CardsRepository>(
    () => CardsRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<CardsRemoteDataSource>(
    () => CardsRemoteDataSourceImpl(api: sl()),
  );

  //! Core
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  //! External
  sl.registerLazySingleton(() => Dio());
}
