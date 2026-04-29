import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/features/login/domain/usecases/login_usecase.dart';
import 'package:grocery3/features/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  void login({
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) async {
    emit(LoginLoading());
    final result = await loginUseCase.call(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (errorModel) => emit(LoginFailure(message: errorModel)),
      (authResult) => emit(LoginSuccess(authResult)),
    );
  }
}
