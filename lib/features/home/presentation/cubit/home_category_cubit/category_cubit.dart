import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/api/dio_consumer.dart';
import 'package:grocery3/core/connection/network_info.dart';
import 'package:grocery3/features/home/data/datasources/remote_data_sources.dart';
import 'package:grocery3/features/home/data/repository/category_repo_impl.dart';
import 'package:grocery3/features/home/domain/usecases/get_all_category_usecase.dart';
import 'package:grocery3/features/home/presentation/cubit/home_category_cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit()
    : getAllCategoryUsecase = GetAllCategoryUsecase(
        categoryRepo: CategoryRepoImpl(
          remoteDataSources: RemoteDataSources(api: DioConsumer(dio: Dio())),
          networkInfo: NetworkInfoImpl(DataConnectionChecker()),
        ),
      ),
      super(CategoryInitial());
  final GetAllCategoryUsecase getAllCategoryUsecase;

  Future<void> getAllCategories() async {
    emit(CategoryLoading());
    final result = await getAllCategoryUsecase.call();
    result.fold(
      (failure) => emit(CategoryError(failure)),
      (categories) => emit(CategorySuccess(categories)),
    );
  }
}
