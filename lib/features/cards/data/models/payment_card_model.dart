import '../../domain/entities/payment_card.dart';

class PaymentCardModel extends PaymentCardEntity {
  PaymentCardModel({
    required super.id,
    required super.cardHolderName,
    required super.cardNumber,
    required super.expiryDate,
    required super.cardType,
  });

  factory PaymentCardModel.fromJson(Map<String, dynamic> json) {
    return PaymentCardModel(
      id: json['id'],
      cardHolderName: json['card_holder_name'] ?? '',
      cardNumber: json['card_number'] ?? '',
      expiryDate: json['expiry_date'] ?? '',
      cardType: json['card_type'] ?? '',
    );
  }
}
