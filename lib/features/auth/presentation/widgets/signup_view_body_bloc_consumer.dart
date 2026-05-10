import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/shared_widgets/custom_progress_hud_indicator.dart';
import 'package:grocery3/core/shared_widgets/snackbar_helper.dart';
import 'package:grocery3/features/auth/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:grocery3/features/auth/presentation/widgets/signup_view_body.dart';
import 'package:auto_route/auto_route.dart';
import 'package:grocery3/core/routes/app_router.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpError) {
          customSnakebar(
            context,
            state.message ?? 'An error occurred',
            isError: true,
          );
        } else if (state is SignUpSuccess) {
          customSnakebar(context, 'Sign Up Successful', isError: false);
          context.router.replace(const LoginViewRoute());
        }
      },
      builder: (context, state) {
        return CoustomProgressIndicatorHud(
          isLoad: state is SignUpLoading,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
