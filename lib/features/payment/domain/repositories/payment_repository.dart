import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/payment_session.dart';

abstract class PaymentRepository {
  Future<Either<Failure, PaymentSession>> getStripeSession({required double amount, required int orderId});
}
