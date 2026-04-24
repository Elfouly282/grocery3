import 'package:flutter_stripe/flutter_stripe.dart';
import '../api/api_keys.dart';

class StripeService {
  Future<void> init() async {
    Stripe.publishableKey = StripeKeys.publishableKey;
    await Stripe.instance.applySettings();
  }

  Future<String> createPaymentMethod({
    required String cardNumber,
    required int expMonth,
    required int expYear,
    required String cvc,
    String? cardHolderName,
  }) async {
    try {
      await Stripe.instance.dangerouslyUpdateCardDetails(
        CardDetails(
          number: cardNumber,
          expirationMonth: expMonth,
          expirationYear: expYear,
          cvc: cvc,
        ),
      );

      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: BillingDetails(name: cardHolderName),
          ),
        ),
      );

      return paymentMethod.id;
    } catch (e) {
      throw Exception("Stripe Error: ${e.toString()}");
    }
  }
}
