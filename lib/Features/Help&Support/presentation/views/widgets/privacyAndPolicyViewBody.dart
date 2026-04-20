
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../cubit/privacyPolicy/privacyPolicy_Cubit.dart';
import '../../cubit/privacyPolicy/privacyPolicy_States.dart';

class privacyAndPolicyViewBody extends StatelessWidget {
  const privacyAndPolicyViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivacyPolicyCubit, PrivacyPolicyState>(
      builder: (context, state) {
        if (state is PrivacyPolicyLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PrivacyPolicyError) {
          return Center(child: Text(state.message));
        }

        if (state is PrivacyPolicySuccess) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Html(
              data: state.page.content,
            ),
          );
        }

        return const SizedBox();
      },
    );


  }
}
