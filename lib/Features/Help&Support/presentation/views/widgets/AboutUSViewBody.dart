
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../cubit/about_Us/about_us_Cubit.dart';
import '../../cubit/about_Us/about_us_States.dart';

class Aboutusviewbody extends StatelessWidget {
  const Aboutusviewbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsCubit,AboutUsState>(
      builder: (context, state) {
        if (state is AboutUsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is AboutUsError) {
          return Center(child: Text(state.message));
        }

        if (state is AboutUsSuccess) {
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
