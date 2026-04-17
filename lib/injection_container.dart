import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'core/api/api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'features/product_details/data/datasources/product_remote_data_source.dart';
import 'features/product_details/data/repositories/product_repository_impl.dart';
import 'features/product_details/domain/repositories/product_repository.dart';
import 'features/product_details/domain/usecases/get_product_details.dart';
import 'features/product_details/presentation/bloc/product_bloc.dart';
import 'features/smart_lists/data/datasources/smart_lists_remote_data_source.dart';
import 'features/smart_lists/data/repositories/smart_lists_repository_impl.dart';
import 'features/smart_lists/domain/repositories/smart_lists_repository.dart';
import 'features/smart_lists/domain/usecases/get_smart_list_details.dart';
import 'features/smart_lists/domain/usecases/get_smart_lists.dart';
import 'features/smart_lists/presentation/bloc/smart_lists_bloc.dart';
import 'features/layout/presentation/cubit/layout_cubit.dart';

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

  //! Features - Smart Lists
  // Bloc
  sl.registerFactory(
    () => SmartListsBloc(
      getSmartListsUseCase: sl(),
      getSmartListDetailsUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetSmartListsUseCase(sl()));
  sl.registerLazySingleton(() => GetSmartListDetailsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<SmartListsRepository>(
    () => SmartListsRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<SmartListsRemoteDataSource>(
    () => SmartListsRemoteDataSourceImpl(sl()),
  );

  //! Core
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  //! External
  sl.registerLazySingleton(() => Dio());
}
