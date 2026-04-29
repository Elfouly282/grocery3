import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/api/api_keys.dart';
import 'package:grocery3/features/checkout/data/models/pay_now_request_model.dart';
import 'package:grocery3/features/checkout/data/models/pay_now_response_model.dart';

abstract class CheckoutRemoteDataSource {
  Future<PayNowResponseModel> payNow(PayNowRequestModel request);
}

class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final ApiConsumer api;

  CheckoutRemoteDataSourceImpl({required this.api});

  @override
  Future<PayNowResponseModel> payNow(PayNowRequestModel request) async {
    final response = await api.post(EndPoint.orders, data: request.toJson());
    return PayNowResponseModel.fromJson(response);
  }
}
