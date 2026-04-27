import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/checkout/presentation/widgets/fulfillment_toggle_widget.dart';
import 'package:grocery3/features/checkout/presentation/widgets/payment_option_tile.dart';

class PaymentOptionsSection extends StatelessWidget {
  final FulfillmentMode fulfillmentMode;
  final String selectedDeliveryPayment;
  final String selectedPickupPayment;
  final ValueChanged<String> onDeliveryPaymentChanged;
  final ValueChanged<String> onPickupPaymentChanged;

  const PaymentOptionsSection({
    super.key,
    required this.fulfillmentMode,
    required this.selectedDeliveryPayment,
    required this.selectedPickupPayment,
    required this.onDeliveryPaymentChanged,
    required this.onPickupPaymentChanged,
  });

  bool get _isDelivery => fulfillmentMode == FulfillmentMode.delivery;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _isDelivery
              ? 'Pay on delivery using one of the these methods'
              : 'Pay on pickup using one of the these methods',
          style: AppStyles.checkoutHintText,
        ),
        const SizedBox(height: 12),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: _isDelivery ? _deliveryOptions() : _pickupOptions(),
        ),
      ],
    );
  }

  Widget _deliveryOptions() {
    return Column(
      key: const ValueKey('delivery_payments'),
      children: [
        PaymentOptionTile(
          icon: Icons.money_outlined,
          label: 'Cash on delivery',
          isSelected: selectedDeliveryPayment == 'cash_delivery',
          onTap: () => onDeliveryPaymentChanged('cash_delivery'),
        ),
        const SizedBox(height: 10),
        PaymentOptionTile(
          icon: Icons.credit_card_outlined,
          label: 'Card on delivery',
          isSelected: selectedDeliveryPayment == 'card_delivery',
          onTap: () => onDeliveryPaymentChanged('card_delivery'),
        ),
      ],
    );
  }

  Widget _pickupOptions() {
    return Column(
      key: const ValueKey('pickup_payments'),
      children: [
        PaymentOptionTile(
          icon: Icons.money_outlined,
          label: 'Cash on Pickup',
          isSelected: selectedPickupPayment == 'cash_pickup',
          onTap: () => onPickupPaymentChanged('cash_pickup'),
        ),
        const SizedBox(height: 10),
        PaymentOptionTile(
          icon: Icons.credit_card_outlined,
          label: 'Card on Pickup',
          isSelected: selectedPickupPayment == 'card_pickup',
          onTap: () => onPickupPaymentChanged('card_pickup'),
        ),
      ],
    );
  }
}
