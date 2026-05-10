import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/api/dio_consumer.dart';
import 'package:grocery3/core/connection/network_info.dart';

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

// Login Feature
import 'package:grocery3/features/login/data/datasources/login_remote_data_source.dart';
import 'package:grocery3/features/login/data/repositories/login_repository_impl.dart';
import 'package:grocery3/features/login/domain/repositories/login_repo.dart';
import 'package:grocery3/features/login/domain/usecases/login_usecase.dart';
import 'package:grocery3/features/login/presentation/cubit/login_cubit.dart';

// Auth/SignUp Feature (Home branch)
import 'package:grocery3/features/auth/data/repos/auth_repo_impl.dart';
import 'package:grocery3/features/auth/domin/repos/auth_repo.dart';
import 'package:grocery3/features/auth/presentation/cubit/cubit/sign_up_cubit.dart';

// Categories Feature (Home branch)
import 'package:grocery3/features/Categories%20&%20SubCategories/data/repos/cateory_repo_impl.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/repos/sub_categry_repo.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/cubit/cubit/sub_category_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Product Details
  sl.registerFactory(() => ProductBloc(getProductDetailsUseCase: sl()));
  sl.registerLazySingleton(() => GetProductDetailsUseCase(sl()));
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(sl()),
  );

  //! Features - Layout
  sl.registerFactory(() => LayoutCubit());

  //! Features - Favorites
  sl.registerFactory(() => FavoritesBloc(getFavoritesUseCase: sl(), toggleFavoriteUseCase: sl()));
  sl.registerLazySingleton(() => GetFavoritesUseCase(repository: sl()));
  sl.registerLazySingleton(() => ToggleFavoriteUseCase(repository: sl()));
  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<FavoritesRemoteDataSource>(
    () => FavoritesRemoteDataSourceImpl(api: sl()),
  );

  //! Features - Orders
  sl.registerFactory(() => OrdersBloc(getOrdersUseCase: sl()));
  sl.registerLazySingleton(() => GetOrdersUseCase(repository: sl()));
  sl.registerLazySingleton<OrdersRepository>(
    () => OrdersRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<OrdersRemoteDataSource>(
    () => OrdersRemoteDataSourceImpl(api: sl()),
  );

  //! Features - Smart Lists
  sl.registerFactory(() => SmartListsBloc(getSmartListsUseCase: sl(), getSmartListDetailsUseCase: sl()));
  sl.registerLazySingleton(() => GetSmartListsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetSmartListDetailsUseCase(repository: sl()));
  sl.registerLazySingleton<SmartListsRepository>(
    () => SmartListsRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<SmartListsRemoteDataSource>(
    () => SmartListsRemoteDataSourceImpl(api: sl()),
  );

  //! Features - Cards
  sl.registerFactory(() => CardsBloc(getCardsUseCase: sl()));
  sl.registerLazySingleton(() => GetCardsUseCase(repository: sl()));
  sl.registerLazySingleton<CardsRepository>(
    () => CardsRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<CardsRemoteDataSource>(
    () => CardsRemoteDataSourceImpl(api: sl()),
  );

  //! Features - Login
  sl.registerFactory(() => LoginCubit(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSource(api: sl()),
  );

  //! Features - Auth/SignUp
  sl.registerFactory(() => SignUpCubit(authRepo: sl()));
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()));

  //! Features - Categories
  sl.registerFactory(() => CategoryCubit(categoryRepo: sl()));
  sl.registerLazySingleton<CategoryRepo>(() => CategoryRepoImpl(sl()));

  //! Core
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
