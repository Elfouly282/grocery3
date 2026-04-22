import 'package:dartz/dartz.dart';
import 'package:grocery3/core/connection/network_info.dart';
import 'package:grocery3/core/error/exception.dart';
import 'package:grocery3/features/home/data/datasources/remote_data_sources.dart';
import 'package:grocery3/features/home/domain/entities/today_deal_entity.dart';
import 'package:grocery3/features/home/domain/repository/today_deal_repo.dart';

class TodayDealsRepoImpl extends TodayDealRepo {
  final RemoteDataSources remoteDataSources;
  final NetworkInfo networkInfo;

  TodayDealsRepoImpl({
    required this.remoteDataSources,
    required this.networkInfo,
  });

  @override
  Future<Either<String, List<DealEntity>>> getAllTodayDeals() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteDataSource = await remoteDataSources.getAllTodayDeals();
        return Right(remoteDataSource.data);
      } on ServerException catch (e) {
        return left(e.errModel.message.toString());
      }
    } else {
      return Left('No internet connection');
    }
  }
}
