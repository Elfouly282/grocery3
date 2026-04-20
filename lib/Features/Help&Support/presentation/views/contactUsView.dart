import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/Help&Support/data/repo/help_and_support_Repo_Impl.dart';
import 'package:grocery3/Features/Help&Support/presentation/cubit/contactUs/ContactUs_Cubit.dart';
import 'package:grocery3/Features/Help&Support/presentation/views/widgets/contactUsViewBody.dart';
import 'package:grocery3/core/%20dependency_injection/get_it.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';

class Contactusview extends StatelessWidget {
  const Contactusview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Contact Us"),
      body: BlocProvider(
        create: (context) =>
            ContactCubit(getIt.get<Help_and_Support_Repo_Impl>()),
        child: Contactusviewbody(),
      ),
    );
  }
}
