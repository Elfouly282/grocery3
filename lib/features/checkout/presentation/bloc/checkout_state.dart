import 'package:equatable/equatable.dart';
import 'package:grocery3/features/checkout/domain/entities/pay_now_response_entity.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutInitial extends CheckoutState {
  const CheckoutInitial();
}

class CheckoutLoading extends CheckoutState {
  const CheckoutLoading();
}

class CheckoutSuccess extends CheckoutState {
  final PayNowResponseEntity response;

  const CheckoutSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class CheckoutError extends CheckoutState {
  final String message;

  const CheckoutError(this.message);

  @override
  List<Object?> get props => [message];
}
