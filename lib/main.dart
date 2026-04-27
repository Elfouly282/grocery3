import 'package:flutter/material.dart';
import 'package:grocery3/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:grocery3/features/payment/presentation/screens/PaymentSuccessView.dart';
import 'package:grocery3/features/payment/presentation/screens/test_payment_success.dart';
import 'package:grocery3/injection_container.dart';

import 'features/payment/presentation/screens/payment_screen.dart';

void main() async {
  await init();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CheckoutScreen(),
  ));
}