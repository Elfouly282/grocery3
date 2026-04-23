
import 'package:flutter/material.dart';

import '../../../../core/utils/theme/app_styles.dart';
import '../../domain/Entity/notification_Entity.dart';
import 'AccountNotificationSection.dart';
import 'DealsPromotionsNotificationSection.dart';
import 'OrderDeliveryNotificationSection.dart';

class notification_view_Body extends StatelessWidget {
  const notification_view_Body({
    super.key,
    required this.order_Delivery_Entity,
    required this.Deals_promotions_Entity,
    required this.account_Reminders_Entity,
  });

  final NotificationEntity order_Delivery_Entity;
  final NotificationEntity Deals_promotions_Entity;
  final NotificationEntity account_Reminders_Entity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const   SizedBox(height: 18),
        const  Text("Order & Delivery Updates", style: AppStyles.font16SemiBold),
        const SizedBox(height: 8),
        OrderDeliveryNotificationSection(notificationEntity: order_Delivery_Entity,),
        const SizedBox(height: 12),
        const   Text("Deals & Promotions", style: AppStyles.font16SemiBold),
        const SizedBox(height: 8),
        DealsPromotionsNotificationSection(notificationEntity:Deals_promotions_Entity ,),
        const   Text("Account & Reminders", style: AppStyles.font16SemiBold),
        AccountRemindersNotificationSection(notificationEntity: account_Reminders_Entity,),
      ],
    );
  }
}


