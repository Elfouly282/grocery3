import 'package:dio/dio.dart';
import 'package:grocery3/core/helper/cache/cache_helper.dart';
import '../models/payment_model.dart';

abstract class PaymentRemoteDataSource {
  Future<PaymentModel> getStripeSession({
    required double amount,
    required int orderId,
  });
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final Dio dio;

  PaymentRemoteDataSourceImpl(this.dio);

  @override
  Future<PaymentModel> getStripeSession({
    required double amount,
    required int orderId,
  }) async {
    String token = CacheHelper.getData(key: 'token') ?? "";
    final response = await dio.post(
      'https://grocery.newcinderella.online/api/payments/stripe/checkout-session',
      data: {'amount': amount, 'order_id': orderId},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      return PaymentModel.fromJson(response.data);
    } else {
      throw Exception('Failed to get stripe session');
    }
  }
}
