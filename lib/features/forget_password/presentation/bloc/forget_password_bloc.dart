import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/features/forget_password/domain/entities/reset_password_entity.dart';
import 'package:grocery3/features/forget_password/domain/entities/verify_otp_entity.dart';
import 'package:grocery3/features/forget_password/domain/usecases/forget_password.dart';
import 'package:grocery3/features/forget_password/domain/usecases/reset_password.dart';
import 'package:grocery3/features/forget_password/domain/usecases/verify_otp.dart';
import 'package:grocery3/features/forget_password/presentation/bloc/forget_password_event.dart';
import 'package:grocery3/features/forget_password/presentation/bloc/forget_password_states.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvents, ForgetPasswordStates> {
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  String? identifier;
  String? otpCode;

  ForgetPasswordBloc({
    required this.forgetPasswordUseCase,
    required this.verifyOtpUseCase,
    required this.resetPasswordUseCase,
  }) : super(IntailForgetPasswordState()) {
    on<ForgetPasswordEvent>((event, emit) async {
      emit(LoadingForgetPasswordState());
      identifier = event.emailOrPhone;
      final result = await forgetPasswordUseCase(event.emailOrPhone);
      result.fold(
        (failure) => emit(ErrorForgetPasswordState(message: failure.message)),
        (_) => emit(SuccessForgetPasswordState()),
      );
    });

    on<VerifyOtpEvent>((event, emit) async {
      if (identifier == null) {
        emit(ErrorVerifyOtpState(message: "Identifier is missing."));
        return;
      }
      emit(LoadingVerifyOtpState());
      otpCode = event.otp;
      final entity = VerifyOtpEntity(identifier: identifier!, otp: event.otp);
      final result = await verifyOtpUseCase(verifyOtpEntity: entity);
      result.fold(
        (failure) => emit(ErrorVerifyOtpState(message: failure.message)),
        (_) => emit(SuccessVerifyOtpState()),
      );
    });

    on<ResetPasswordEvent>((event, emit) async {
      if (identifier == null || otpCode == null) {
        emit(ErrorResetPasswordState(message: "Identifier or OTP missing."));
        return;
      }
      emit(LoadingResetPasswordState());
      final entity = ResetPasswordEntity(
        identifier: identifier!,
        otp: otpCode!,
        password: event.newPassword,
        confirmPassword: event.confirmPassword,
      );
      final result = await resetPasswordUseCase(resetPasswordEntity: entity);
      result.fold(
        (failure) => emit(ErrorResetPasswordState(message: failure.message)),
        (_) => emit(SuccessResetPasswordState()),
      );
    });
  }
}
