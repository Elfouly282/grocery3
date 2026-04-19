import 'package:dartz/dartz.dart';
import 'package:grocery3/features/home/domain/entities/today_deal_entity.dart';
import 'package:grocery3/features/home/domain/repository/today_deal_repo.dart';

class GetAllTodayDealsUsecase {
  final TodayDealRepo todayDealRepo;

  GetAllTodayDealsUsecase({required this.todayDealRepo});

  Future<Either<String, List<DealEntity>>> call() async {
    return await todayDealRepo.getAllTodayDeals();
  }
}
