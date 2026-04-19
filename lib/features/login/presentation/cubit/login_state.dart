import 'package:grocery3/features/login/domain/entities/user_entity.dart';

class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final AuthResult authResult;
  LoginSuccess(this.authResult);
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure({required this.message});
}
