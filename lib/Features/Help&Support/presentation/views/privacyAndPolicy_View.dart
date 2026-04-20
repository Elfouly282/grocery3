import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/Help&Support/data/repo/help_and_support_Repo_Impl.dart';
import 'package:grocery3/Features/Help&Support/presentation/cubit/privacyPolicy/privacyPolicy_Cubit.dart';
import 'package:grocery3/Features/Help&Support/presentation/views/widgets/privacyAndPolicyViewBody.dart';
import 'package:grocery3/core/%20dependency_injection/get_it.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';

class PrivacyandpolicyView extends StatelessWidget {
  const PrivacyandpolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Privacy Policy"),
      body: BlocProvider(
        create: (context) =>
            PrivacyPolicyCubit(getIt.get<Help_and_Support_Repo_Impl>())..getPage(),
        child: privacyAndPolicyViewBody(),
      ),
    );
  }
}
