import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class OrderItem {
  final String name;
  final double price;

  const OrderItem({required this.name, required this.price});
}

class OrderSummaryWidget extends StatelessWidget {
  final List<OrderItem> items;
  final double deliveryFee;

  const OrderSummaryWidget({
    super.key,
    required this.items,
    required this.deliveryFee,
  });
  double get _total =>
      items.fold<double>(0, (sum, item) => sum + item.price) + deliveryFee;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order Summary',
          style: AppStyles.checkoutSectionTitle,
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.checkoutBorder, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.checkoutShadow.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              ...items.map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: _SummaryRow(label: item.name, value: item.price),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Divider(color: AppColors.checkoutBorder, thickness: 1),
              ),
              _SummaryRow(label: 'Delivery Fee', value: deliveryFee),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Divider(color: AppColors.checkoutBorder, thickness: 1),
              ),
              _SummaryRow(label: 'Total', value: _total, isBold: true),
            ],
          ),
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final double value;
  final bool isBold;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    final style =
        isBold
            ? AppStyles.checkoutPrimaryBodyBold
            : AppStyles.checkoutPrimaryBody;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text('${value == 0 ? '00' : value.toStringAsFixed(0)} £', style: style),
      ],
    );
  }
}
