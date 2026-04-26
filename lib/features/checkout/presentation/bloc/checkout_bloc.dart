import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/features/checkout/domain/usecases/pay_now_usecase.dart';
import 'package:grocery3/features/checkout/presentation/bloc/checkout_event.dart';
import 'package:grocery3/features/checkout/presentation/bloc/checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final PayNowUseCase payNowUseCase;

  CheckoutBloc({required this.payNowUseCase}) : super(const CheckoutInitial()) {
    on<PayNowEvent>((event, emit) async {
      emit(const CheckoutLoading());
      final result = await payNowUseCase(event.params);
      result.fold(
        (failure) => emit(CheckoutError(failure.message)),
        (response) => emit(CheckoutSuccess(response)),
      );
    });
  }
}
