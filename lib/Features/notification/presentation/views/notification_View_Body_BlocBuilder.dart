import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/notification/domain/Entity/notification_Entity.dart';
import 'package:grocery3/Features/notification/presentation/Cubit/notification_cubit.dart';
import 'package:grocery3/Features/notification/presentation/Cubit/notification_state.dart';
import 'package:grocery3/Features/notification/presentation/views/Custom_BackgroundContainer.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

import 'AccountNotificationSection.dart';
import 'DealsPromotionsNotificationSection.dart';
import 'OrderDeliveryNotificationSection.dart';
import 'custom_Divider.dart';
import 'notification_view_body.dart';

class notificationViewBody_BlocBuilder extends StatelessWidget {
  const notificationViewBody_BlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {

            if (state is NotificationFailure) {
              return Center(child: Text(state.message));
            }
            if(state is NotificationSuccess) {
              final order_Delivery_Entity = state.notifications.firstWhere(
                    (e) => e.key == "order_delivery_updates",
              );
              final Deals_promotions_Entity = state.notifications.firstWhere(
                    (e) => e.key == "deals_promotions",
              );
              final account_Reminders_Entity = state.notifications.firstWhere(
                    (e) => e.key == "account_reminders",
              );

              return notification_view_Body(
                order_Delivery_Entity: order_Delivery_Entity,
                Deals_promotions_Entity: Deals_promotions_Entity,
                account_Reminders_Entity: account_Reminders_Entity,
              );

            }
           return Center(child: CircularProgressIndicator());
          }
        ),
      ),
    );
  }
}
