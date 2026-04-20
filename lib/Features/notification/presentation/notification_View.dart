import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/notification/data/repo/notificationRepo_Imp.dart';
import 'package:grocery3/Features/notification/presentation/Cubit/notification_cubit.dart';
import 'package:grocery3/Features/notification/presentation/views/notification_View_Body_BlocBuilder.dart';
import 'package:grocery3/core/%20dependency_injection/get_it.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';

class notificationView extends StatelessWidget {
  const notificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(getIt.get<NotificationRepoImpl>())..getSettings(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: CustomAppBar(title: "notifications"),
        body: notificationViewBody_BlocBuilder(),
      ),
    );
  }
}
