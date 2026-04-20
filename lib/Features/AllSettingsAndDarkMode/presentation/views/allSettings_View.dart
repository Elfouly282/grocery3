import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/AllSettingsAndDarkMode/presentation/cubit/delete_account/delete_cubit.dart';
import 'package:grocery3/Features/AllSettingsAndDarkMode/presentation/views/widgets/settingsViewBody.dart';
import 'package:grocery3/core/%20dependency_injection/get_it.dart';
import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/api/dio_consumer.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';

class AllsettingsView extends StatelessWidget {
  const AllsettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Settings"),
      body: BlocProvider(
        create: (context) => DeleteAccountCubit(getIt.get<DioConsumer>()),
        child: Settingsviewbody(),
      ),
    );
  }
}
