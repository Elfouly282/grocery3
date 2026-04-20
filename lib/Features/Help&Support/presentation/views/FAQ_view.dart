import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/Help&Support/data/repo/help_and_support_Repo_Impl.dart';
import 'package:grocery3/Features/Help&Support/presentation/cubit/Faqs/Faqs_Cubit.dart';
import 'package:grocery3/Features/Help&Support/presentation/views/widgets/FAQ_view_body.dart';
import 'package:grocery3/core/%20dependency_injection/get_it.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';

class FaqView extends StatelessWidget {
  const FaqView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(title: "FAQS"),
      body: BlocProvider(
        create: (context) => FaqCubit(getIt.get<Help_and_Support_Repo_Impl>())..getFaqs(),
        child: FaqViewBody(),
      ),
    );
  }
}
