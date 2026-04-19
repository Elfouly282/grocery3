import 'package:dartz/dartz.dart';
import 'package:grocery3/features/home/domain/entities/today_deal_entity.dart';

abstract class TodayDealRepo {
  Future<Either<String, List<DealEntity>>> getAllTodayDeals();
}
