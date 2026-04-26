import 'package:equatable/equatable.dart';
import 'package:grocery3/features/checkout/domain/usecases/pay_now_usecase.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class PayNowEvent extends CheckoutEvent {
  final PayNowParams params;

  const PayNowEvent(this.params);

  @override
  List<Object?> get props => [params];
}
