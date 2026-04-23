import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/features/auth/domin/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.authRepo}) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    emit(SignUpLoading());
    var result = await authRepo.signUp(
      email: email,
      password: password,
      name: name,
      phone: phone,
    );
    result.fold(
      (failure) => emit(SignUpError(message: failure)),
      (user) => emit(SignUpSuccess()),
    );
  }
}
