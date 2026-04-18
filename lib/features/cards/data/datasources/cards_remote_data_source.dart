import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/api/api_keys.dart';
import 'package:grocery3/features/cards/data/models/payment_card_model.dart';

abstract class CardsRemoteDataSource {
  Future<List<PaymentCardModel>> getCards();
}

class CardsRemoteDataSourceImpl implements CardsRemoteDataSource {
  final ApiConsumer api;

  CardsRemoteDataSourceImpl({required this.api});

  @override
  Future<List<PaymentCardModel>> getCards() async {
    final response = await api.get(EndPoint.cards);
    return (response[ApiKeys.data] as List)
        .map((e) => PaymentCardModel.fromJson(e))
        .toList();
  }
}
