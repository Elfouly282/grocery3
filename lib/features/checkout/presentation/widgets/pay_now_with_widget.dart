import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class PayNowWithWidget extends StatefulWidget {
  const PayNowWithWidget({super.key});

  @override
  State<PayNowWithWidget> createState() => _PayNowWithWidgetState();
}

class _PayNowWithWidgetState extends State<PayNowWithWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pay now with',
          style: AppStyles.checkoutSectionTitle,
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Container(
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
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 22,
                  decoration: BoxDecoration(
                    color: AppColors.checkoutMastercard,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Text(
                      'MC',
                      style: AppStyles.checkoutCardBrandText,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Mastercard ••••  8888',
                    style: AppStyles.checkoutPrimaryBody,
                  ),
                ),
                AnimatedRotation(
                  turns: _expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.checkoutSecondaryText,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_expanded) ...[
          const SizedBox(height: 8),
          _OtherCardOption(
            label: 'Visa ••••  4242',
            color: AppColors.checkoutVisa,
          ),
        ],
        const SizedBox(height: 12),
        Row(
          children: [
            _PaymentBadge(
              label: 'iXP',
              bgColor: AppColors.checkoutIxpBackground,
              textColor: AppColors.checkoutIxpText,
            ),
            const SizedBox(width: 10),
            _PaymentBadge(
              label: 'FP',
              bgColor: AppColors.checkoutFpBackground,
              textColor: AppColors.checkoutFpText,
              icon: Icons.account_balance_wallet_outlined,
            ),
          ],
        ),
      ],
    );
  }
}

class _OtherCardOption extends StatelessWidget {
  final String label;
  final Color color;

  const _OtherCardOption({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.checkoutCardBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.checkoutBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 22,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Center(
              child: Text(
                'VISA',
                style: AppStyles.checkoutCardBrandSmallText,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: AppStyles.checkoutPrimaryBody,
          ),
        ],
      ),
    );
  }
}

class _PaymentBadge extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Color textColor;
  final IconData? icon;

  const _PaymentBadge({
    required this.label,
    required this.bgColor,
    required this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 36,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: bgColor.withValues(alpha: 0.5)),
      ),
      child: Center(
        child: icon != null
            ? Icon(icon, color: textColor, size: 18)
            : Text(
                label,
                style: AppStyles.checkoutBadgeText.copyWith(color: textColor),
              ),
      ),
    );
  }
}
