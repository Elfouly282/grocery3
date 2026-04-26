import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/checkout/domain/entities/pay_now_response_entity.dart';
import 'package:grocery3/features/checkout/domain/repositories/checkout_repository.dart';

class PayNowUseCase {
  final CheckoutRepository repository;

  PayNowUseCase({required this.repository});

  Future<Either<Failure, PayNowResponseEntity>> call(PayNowParams params) async {
    return repository.payNow(params);
  }
}

class PayNowParams extends Equatable {
  final String paymentMethod;
  final String deliveryType;
  final int addressId;
  final double amount;
  final String paymentMethodId;
  final String? deliverySpeed;

  const PayNowParams({
    required this.paymentMethod,
    required this.deliveryType,
    required this.addressId,
    required this.amount,
    required this.paymentMethodId,
    this.deliverySpeed,
  });

  @override
  List<Object?> get props => [
        paymentMethod,
        deliveryType,
        addressId,
        amount,
        paymentMethodId,
        deliverySpeed,
      ];
}
