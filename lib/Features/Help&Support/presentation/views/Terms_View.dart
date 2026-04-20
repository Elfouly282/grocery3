
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/Help&Support/data/repo/help_and_support_Repo_Impl.dart';
import 'package:grocery3/Features/Help&Support/presentation/cubit/Terms/Terms_cubit.dart';
import 'package:grocery3/Features/Help&Support/presentation/views/Terms_view_Body.dart';
import 'package:grocery3/core/%20dependency_injection/get_it.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';

class TermsView extends StatelessWidget {
  const TermsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Terms and Conditions"),
      body: BlocProvider(
          create: (context) => TermsCubit(getIt.get<Help_and_Support_Repo_Impl>())..getTerms(),
          child: TermsViewBody()),
    );
  }
}
