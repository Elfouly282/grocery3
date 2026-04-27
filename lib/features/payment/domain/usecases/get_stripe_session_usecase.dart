import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/payment_session.dart';
import '../repositories/payment_repository.dart';

class GetStripeSessionUseCase {
  final PaymentRepository repository;

  GetStripeSessionUseCase(this.repository);

  Future<Either<Failure, PaymentSession>> call({
    required int orderId,
    required double amount,
  }) async {
    return await repository.getStripeSession(
      orderId: orderId,
      amount: amount,
    );
  }
}
