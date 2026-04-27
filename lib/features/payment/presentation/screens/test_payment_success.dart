import 'package:flutter/material.dart';
import 'package:grocery3/features/payment/domain/entities/PaymentDetails.dart';
import 'package:grocery3/features/payment/presentation/screens/PaymentSuccessView.dart';

class TestPaymentSuccess extends StatelessWidget {
  const TestPaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final mockDetails = PaymentDetails(
      transactionId: 'TRX-987654321',
      date: '26 April, 2026',
      paymentMethod: 'Credit Card',
      amount: 150.50,
    );

    return PaymentSuccessView(details: mockDetails);
  }
}
