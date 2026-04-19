import 'package:grocery3/features/home/domain/entities/today_deal_entity.dart';

class TodayDealsState {}

class TodayDealsInitial extends TodayDealsState {}

class TodayDealsLoading extends TodayDealsState {}

class TodayDealsSuccess extends TodayDealsState {
    
  final List<DealEntity> data;

  TodayDealsSuccess({required this.data});
}

class TodayDealsError extends TodayDealsState {
  final String message;

  TodayDealsError({required this.message});

}