import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/api/dio_consumer.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/data/repos/cateory_repo_impl.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/repos/sub_categry_repo.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/cubit/cubit/sub_category_cubit.dart';
import 'package:grocery3/features/auth/data/repos/auth_repo_impl.dart';
import 'package:grocery3/features/auth/domin/repos/auth_repo.dart';
import 'package:grocery3/features/auth/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:grocery3/features/cards/data/datasources/cards_remote_data_source.dart';
import 'package:grocery3/features/cards/data/repositories/cards_repository_impl.dart';
import 'package:grocery3/features/cards/domain/repositories/cards_repository.dart';
import 'package:grocery3/features/cards/domain/usecases/get_cards.dart';
import 'package:grocery3/features/cards/presentation/bloc/cards_bloc.dart';
import 'package:grocery3/features/favorites/data/datasources/favorites_remote_data_source.dart';
import 'package:grocery3/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:grocery3/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:grocery3/features/favorites/domain/usecases/get_favorites.dart';
import 'package:grocery3/features/favorites/domain/usecases/toggle_favorite.dart';
import 'package:grocery3/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:grocery3/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:grocery3/features/orders/data/datasources/orders_remote_data_source.dart';
import 'package:grocery3/features/orders/data/repositories/orders_repository_impl.dart';
import 'package:grocery3/features/orders/domain/repositories/orders_repository.dart';
import 'package:grocery3/features/orders/domain/usecases/get_orders.dart';
import 'package:grocery3/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:grocery3/features/product_details/data/datasources/product_remote_data_source.dart';
import 'package:grocery3/features/product_details/data/repositories/product_repository_impl.dart';
import 'package:grocery3/features/product_details/domain/repositories/product_repository.dart';
import 'package:grocery3/features/product_details/domain/usecases/get_product_details.dart';
import 'package:grocery3/features/product_details/presentation/bloc/product_bloc.dart';
import 'package:grocery3/features/smart_lists/data/datasources/smart_lists_remote_data_source.dart';
import 'package:grocery3/features/smart_lists/data/repositories/smart_lists_repository_impl.dart';
import 'package:grocery3/features/smart_lists/domain/repositories/smart_lists_repository.dart';
import 'package:grocery3/features/smart_lists/domain/usecases/get_smart_list_details.dart';
import 'package:grocery3/features/smart_lists/domain/usecases/get_smart_lists.dart';
import 'package:grocery3/features/smart_lists/presentation/bloc/smart_lists_bloc.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt<ApiConsumer>()));
  getIt.registerSingleton<SignUpCubit>(
    SignUpCubit(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerSingleton<CategoryRepo>(CategoryRepoImpl(getIt<ApiConsumer>()));
  getIt.registerSingleton<CategoryCubit>(
    CategoryCubit(categoryRepo: getIt<CategoryRepo>()),
  );

  //  >>>>>>>> kalifa's get_it registrations <<<<<<<<<<<<<<<<<<<<
  //! Features - Product Details
  // Bloc
  getIt.registerFactory(() => ProductBloc(getProductDetailsUseCase: getIt()));

  //! Features - Layout
  // Cubit
  getIt.registerFactory(() => LayoutCubit());

  // Use cases
  getIt.registerLazySingleton(() => GetProductDetailsUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(api: getIt()),
  );

  //! Features - Favorites
  // Bloc
  getIt.registerFactory(
    () => FavoritesBloc(
      getFavoritesUseCase: getIt(),
      toggleFavoriteUseCase: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetFavoritesUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => ToggleFavoriteUseCase(repository: getIt()));

  // Repository
  getIt.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(remoteDataSource: getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<FavoritesRemoteDataSource>(
    () => FavoritesRemoteDataSourceImpl(api: getIt()),
  );

  //! Features - Orders
  // Bloc
  getIt.registerFactory(() => OrdersBloc(getOrdersUseCase: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetOrdersUseCase(repository: getIt()));

  // Repository
  getIt.registerLazySingleton<OrdersRepository>(
    () => OrdersRepositoryImpl(remoteDataSource: getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<OrdersRemoteDataSource>(
    () => OrdersRemoteDataSourceImpl(api: getIt()),
  );

  //! Features - Smart Lists
  // Bloc
  getIt.registerFactory <SmartListsBloc>(
    () => SmartListsBloc(
      getSmartListsUseCase: getIt(),
      getSmartListDetailsUseCase: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton<GetSmartListsUseCase>(
    () => GetSmartListsUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton<GetSmartListDetailsUseCase>(
    () => GetSmartListDetailsUseCase(repository: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<SmartListsRepository>(
    () => SmartListsRepositoryImpl(remoteDataSource: getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<SmartListsRemoteDataSource>(
    () => SmartListsRemoteDataSourceImpl(api: getIt()),
  );

  //! Features - Cards
  // Bloc
  getIt.registerFactory(() => CardsBloc(getCardsUseCase: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetCardsUseCase(repository: getIt()));

  // Repository
  getIt.registerLazySingleton<CardsRepository>(
    () => CardsRepositoryImpl(remoteDataSource: getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<CardsRemoteDataSource>(
    () => CardsRemoteDataSourceImpl(api: getIt()),
  );

  //! Core
  // getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));

  //! External
  getIt.registerLazySingleton(() => Dio());
}
