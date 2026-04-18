class PaymentCardEntity {
  final int id;
  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;
  final String cardType;

  PaymentCardEntity({
    required this.id,
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardType,
  });
}
