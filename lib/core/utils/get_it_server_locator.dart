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
}
