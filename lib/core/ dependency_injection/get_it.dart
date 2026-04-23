import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery3/Features/Add_New_List/data/datasources/addSmartListDataSource.dart';
import 'package:grocery3/Features/Add_New_List/data/datasources/productRemoteDataSource.dart';
import 'package:grocery3/Features/Add_New_List/data/repo/addSmartList_Imp.dart';
import 'package:grocery3/Features/Add_New_List/data/repo/productRepoImpl.dart';
import 'package:grocery3/Features/Add_New_List/domain/repo/addSmartListRepo.dart';
import 'package:grocery3/Features/Add_New_List/domain/useCase/addSmartList_UseCase.dart';
import 'package:grocery3/Features/Add_New_List/domain/useCase/productUseCase.dart';
import 'package:grocery3/Features/Help&Support/data/repo/help_and_support_Repo_Impl.dart';
import 'package:grocery3/Features/notification/data/repo/notificationRepo_Imp.dart';
import 'package:grocery3/core/api/dio_consumer.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => DioConsumer(dio: getIt.get<Dio>()));
  getIt.registerLazySingleton(
    () => NotificationRepoImpl(getIt.get<DioConsumer>()),
  );
  getIt.registerLazySingleton(
    () => ProductRemoteDataSourceImpl(getIt.get<DioConsumer>()),
  );
  getIt.registerLazySingleton(
    () => AddSmartListRemoteDataSourceImpl(getIt.get<DioConsumer>()),
  );
  getIt.registerLazySingleton(
    () => ProductRepositoryImpl(
      remoteDataSource: getIt.get<ProductRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerLazySingleton(
    () => AddSmartListRepoImpl(
      remote: getIt.get<AddSmartListRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerLazySingleton(
        () => AddSmartListUseCase(repo: getIt.get<AddSmartListRepoImpl>()),
  );
  getIt.registerLazySingleton(
    () => GetProductsUseCase(getIt.get<ProductRepositoryImpl>()),
  );
  getIt.registerLazySingleton(
    () => Help_and_Support_Repo_Impl(getIt.get<DioConsumer>()),
  );
}
