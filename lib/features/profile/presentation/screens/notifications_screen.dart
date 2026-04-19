import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/presentation/widgets/custom_divider.dart';
import 'package:grocery3/features/profile/presentation/widgets/notification_model.dart';
import '../widgets/notification_section.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<NotificationModel> _orderItems = [
    NotificationModel(label: 'Order Confirmation', isEnabled: true),
    NotificationModel(label: 'Order Shipped', isEnabled: true),
    NotificationModel(label: 'Delivery Updates', isEnabled: false),
    NotificationModel(label: 'Out-of-Stock Alerts', isEnabled: true),
  ];

  final List<NotificationModel> _dealsItems = [
    NotificationModel(label: 'Weekly Discounts', isEnabled: false),
    NotificationModel(label: 'Exclusive Member Offers', isEnabled: true),
    NotificationModel(label: 'Seasonal Campaigns', isEnabled: true),
  ];

  final List<NotificationModel> _accountItems = [
    NotificationModel(label: 'Cart Reminders', isEnabled: true),
    NotificationModel(label: 'Payment & Billing', isEnabled: false),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          bgColor: AppColors.profileBackground,
          showBackButton: true,
          style: AppStyles.font16Medium.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
          title: 'Notifications',
        ),
        backgroundColor: AppColors.profileBackground,
        body: Column(
          children: [
            CustomDivider(thickness: 1.5),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 28),

                children: [
                  NotificationSection(
                    title: 'Order & Delivery Updates',
                    items: _orderItems,
                    onToggle: (index, value) =>
                        setState(() => _orderItems[index].isEnabled = value),
                  ),
                  NotificationSection(
                    title: 'Deals & Promotions',
                    items: _dealsItems,
                    onToggle: (index, value) =>
                        setState(() => _dealsItems[index].isEnabled = value),
                  ),
                  NotificationSection(
                    title: 'Account & Reminders',
                    items: _accountItems,
                    onToggle: (index, value) =>
                        setState(() => _accountItems[index].isEnabled = value),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
