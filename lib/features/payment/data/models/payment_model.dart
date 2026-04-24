import '../../domain/entities/payment_session.dart';

class PaymentModel extends PaymentSession {
  const PaymentModel({required super.url});

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
     url: json['data'] != null ? json['data']['checkout_url'] ?? '' : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'url': url};
  }
}
