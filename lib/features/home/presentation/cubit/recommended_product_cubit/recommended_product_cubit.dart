import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/api/dio_consumer.dart';
import 'package:grocery3/core/connection/network_info.dart';
import 'package:grocery3/features/home/data/datasources/remote_data_sources.dart';
import 'package:grocery3/features/home/data/repository/recommended_products_repo_impl.dart';
import 'package:grocery3/features/home/domain/usecases/get_all_recommended_products_usecase.dart';
import 'package:grocery3/features/home/presentation/cubit/recommended_product_cubit/recommended_product_state.dart';

class RecommendedProductCubit extends Cubit<RecommendedProductState> {
  RecommendedProductCubit()
    : recommendedProductsUsecase = GetAllRecommendedProductsUsecase(
        recommendedProductsRepo: RecommendedProductsRepoImpl(
          remoteDataSources: RemoteDataSources(api: DioConsumer(dio: Dio())),
          networkInfo: NetworkInfoImpl(DataConnectionChecker()),
        ),
      ),
      super(RecommendedProductInitial());

  final GetAllRecommendedProductsUsecase recommendedProductsUsecase;

  Future<void> getAllRecommendedProducts() async {
    emit(RecommendedProductLoading());
    final result = await recommendedProductsUsecase.call();
    result.fold(
      (errorMessage) => emit(RecommendedProductError(message: errorMessage)),
      (data) => emit(RecommendedProductSuccess(data: data)),
    );
  }
}
