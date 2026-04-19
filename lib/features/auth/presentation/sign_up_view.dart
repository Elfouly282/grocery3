import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/utils/get_it_server_locator.dart';
import 'package:grocery3/features/auth/domin/repos/auth_repo.dart';
import 'package:grocery3/features/auth/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:grocery3/features/auth/presentation/widgets/signup_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(authRepo: getIt<AuthRepo>()),
      child: const Scaffold(body: SignupViewBodyBlocConsumer()),
    );
  }
}
