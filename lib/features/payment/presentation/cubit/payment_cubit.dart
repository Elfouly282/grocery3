import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/features/payment/domain/usecases/get_stripe_session_usecase.dart';

import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
   final GetStripeSessionUseCase getStripeSessionUseCase;
 
  PaymentCubit({required this.getStripeSessionUseCase}) : super(PaymentInitial());

  Future<void> startStripePayment({required int orderId, required double amount}) async {
    emit(PaymentLoading());

     final result = await getStripeSessionUseCase(orderId: orderId, amount: amount);

    result.fold(
      (failure) => emit(PaymentError(failure.message)),
      (session) => emit(NavigateToWebView(session.url)),
    );
  }

  Future<void> createOrderAndPay() async {
    emit(PaymentLoading());
    
     }

  void handlePaymentResult({required bool isSuccess}) {
    if (isSuccess) {
      emit(PaymentSuccess());
    } else {
      emit(PaymentInitial()); 
    }
  }
}