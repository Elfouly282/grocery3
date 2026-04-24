import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery3/features/payment/data/datasources/payment_remote_data_source.dart';
import 'package:grocery3/features/payment/data/repositories/payment_repository_impl.dart';
import 'package:grocery3/features/payment/domain/repositories/payment_repository.dart';
import 'package:grocery3/features/payment/domain/usecases/get_stripe_session_usecase.dart';
import 'package:grocery3/features/payment/presentation/cubit/payment_cubit.dart';
import 'api/api_consumer.dart';
import 'api/dio_consumer.dart';
import 'helper/cache/cache_helper.dart';

import 'services/stripe_service.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerFactory(() => PaymentCubit(getStripeSessionUseCase: sl()));

  sl.registerLazySingleton(() => GetStripeSessionUseCase(sl()));

  sl.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<PaymentRemoteDataSource>(
    () => PaymentRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));
  await CacheHelper.init();
  sl.registerLazySingleton(() => CacheHelper());

  sl.registerLazySingleton(() => StripeService());
}
