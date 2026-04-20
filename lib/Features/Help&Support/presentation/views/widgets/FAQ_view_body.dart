
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/Faqs/Faqs_Cubit.dart';
import '../../cubit/Faqs/Faqs_States.dart';


class FaqViewBody extends StatelessWidget {
  const FaqViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqCubit, FaqState>(
      builder: (context, state) {
        if (state is FaqLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is FaqFailure) {
          return Center(child: Text(state.message));
        }

        if (state is FaqSuccess) {
          return ListView.builder(
            itemCount: state.faqs.length,
            itemBuilder: (context, index) {
              final faq = state.faqs[index];

              return ExpansionTile(
                title: Text(faq.question),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(faq.answer),
                  ),
                ],
              );
            },
          );
        }

        return const SizedBox();
      },
    );

  }
}


