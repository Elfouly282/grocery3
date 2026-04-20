import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery3/Features/Help&Support/data/repo/help_and_support_Repo_Impl.dart';
import 'package:grocery3/Features/notification/data/repo/notificationRepo_Imp.dart';
import 'package:grocery3/core/api/dio_consumer.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => DioConsumer(dio: getIt.get<Dio>()));
  getIt.registerLazySingleton(() => NotificationRepoImpl(getIt.get<DioConsumer>()));
  getIt.registerLazySingleton(() => Help_and_Support_Repo_Impl(getIt.get<DioConsumer>()));
}
