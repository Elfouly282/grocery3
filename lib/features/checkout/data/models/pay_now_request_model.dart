import 'package:grocery3/features/checkout/domain/usecases/pay_now_usecase.dart';

class PayNowRequestModel {
  final String paymentMethod;
  final String deliveryType;
  final int addressId;
  final double amount;
  final String paymentMethodId;
  final String? deliverySpeed;

  const PayNowRequestModel({
    required this.paymentMethod,
    required this.deliveryType,
    required this.addressId,
    required this.amount,
    required this.paymentMethodId,
    required this.deliverySpeed,
  });

  factory PayNowRequestModel.fromParams(PayNowParams params) {
    return PayNowRequestModel(
      paymentMethod: params.paymentMethod,
      deliveryType: params.deliveryType,
      addressId: params.addressId,
      amount: params.amount,
      paymentMethodId: params.paymentMethodId,
      deliverySpeed: params.deliverySpeed,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> body = {
      'payment_method': paymentMethod,
      'delivery_type': deliveryType,
      'address_id': addressId,
      'amount': amount,
      'payment_method_id': paymentMethodId,
    };
    if (deliverySpeed != null && deliverySpeed!.isNotEmpty) {
      body['delivery_speed'] = deliverySpeed;
    }
    return body;
  }
}
