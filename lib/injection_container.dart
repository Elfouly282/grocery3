import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'core/api/api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'features/product_details/data/datasources/product_remote_data_source.dart';
import 'features/product_details/data/repositories/product_repository_impl.dart';
import 'features/product_details/domain/repositories/product_repository.dart';
import 'features/product_details/domain/usecases/get_product_details.dart';
import 'features/product_details/presentation/bloc/product_bloc.dart';
import 'features/favorites/data/datasources/favorites_remote_data_source.dart';
import 'features/favorites/data/repositories/favorites_repository_impl.dart';
import 'features/favorites/domain/repositories/favorites_repository.dart';
import 'features/favorites/domain/usecases/get_favorites.dart';
import 'features/favorites/domain/usecases/toggle_favorite.dart';
import 'features/favorites/presentation/bloc/favorites_bloc.dart';
import 'features/orders/data/datasources/orders_remote_data_source.dart';
import 'features/orders/data/repositories/orders_repository_impl.dart';
import 'features/orders/domain/repositories/orders_repository.dart';
import 'features/orders/domain/usecases/get_orders.dart';
import 'features/orders/presentation/bloc/orders_bloc.dart';
import 'features/layout/presentation/cubit/layout_cubit.dart';
import 'features/cards/data/datasources/cards_remote_data_source.dart';
import 'features/cards/data/repositories/cards_repository_impl.dart';
import 'features/cards/domain/repositories/cards_repository.dart';
import 'features/cards/domain/usecases/get_cards.dart';
import 'features/cards/presentation/bloc/cards_bloc.dart';

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
    () => ProductRemoteDataSourceImpl(sl()),
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
  sl.registerLazySingleton(() => GetFavoritesUseCase(sl()));
  sl.registerLazySingleton(() => ToggleFavoriteUseCase(sl()));

  // Repository
  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<FavoritesRemoteDataSource>(
    () => FavoritesRemoteDataSourceImpl(sl()),
  );

  //! Features - Orders
  // Bloc
  sl.registerFactory(() => OrdersBloc(getOrdersUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetOrdersUseCase(sl()));

  // Repository
  sl.registerLazySingleton<OrdersRepository>(
    () => OrdersRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<OrdersRemoteDataSource>(
    () => OrdersRemoteDataSourceImpl(sl()),
  );

  //! Features - Cards
  // Bloc
  sl.registerFactory(() => CardsBloc(getCardsUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetCardsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<CardsRepository>(
    () => CardsRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<CardsRemoteDataSource>(
    () => CardsRemoteDataSourceImpl(sl()),
  );

  //! Core
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  //! External
  sl.registerLazySingleton(() => Dio());
}
