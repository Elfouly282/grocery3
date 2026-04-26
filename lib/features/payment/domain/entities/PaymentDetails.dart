class PaymentDetails {
  final String transactionId;
  final String date;
  final String paymentMethod;
  final double amount;

  PaymentDetails({
    required this.transactionId,
    required this.date,
    required this.paymentMethod,
    required this.amount,
  });
}