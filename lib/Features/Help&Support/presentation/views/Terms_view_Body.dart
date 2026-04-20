import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../cubit/Terms/Terms_States.dart';
import '../cubit/Terms/Terms_cubit.dart';

class TermsViewBody extends StatelessWidget {
  const TermsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermsCubit, TermsState>(
        builder: (context, state) {
          if (state is TermsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TermsError) {
            return Center(child: Text(state.message));
          }

          if (state is TermsSuccess) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Html(
                data: state.terms.content,
              ),
            );
          }

          return const SizedBox();
        },
      );

  }
}