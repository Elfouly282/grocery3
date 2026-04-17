import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/api_keys.dart';
import '../models/payment_card_model.dart';

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
