import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/api/dio_consumer.dart';
import 'package:grocery3/core/connection/network_info.dart';
import 'package:grocery3/features/home/data/datasources/remote_data_sources.dart';
import 'package:grocery3/features/home/data/repository/today_deals_repo_impl.dart';
import 'package:grocery3/features/home/domain/usecases/get_all_today_deals_usecase.dart';
import 'package:grocery3/features/home/presentation/cubit/today_deals_cubit/today_deals_state.dart';

class TodayDealsCubit extends Cubit<TodayDealsState> {
  TodayDealsCubit()
    : getAllTodayDealsUsecase = GetAllTodayDealsUsecase(
        todayDealRepo: TodayDealsRepoImpl(
          remoteDataSources: RemoteDataSources(api: DioConsumer(dio: Dio())), networkInfo: NetworkInfoImpl(DataConnectionChecker()),
        ),
      ),
      super(TodayDealsInitial());

  final GetAllTodayDealsUsecase getAllTodayDealsUsecase;

  Future<void> getAllTodayDeals() async {
    emit(TodayDealsLoading());
    final result = await getAllTodayDealsUsecase.call();
    result.fold(
      (errorMessage) => emit(TodayDealsError(message: errorMessage)),
      (data) => emit(TodayDealsSuccess(data: data)),
    );
  }
}
