import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/checkout/domain/entities/pay_now_response_entity.dart';
import 'package:grocery3/features/checkout/domain/usecases/pay_now_usecase.dart';

abstract class CheckoutRepository {
  Future<Either<Failure, PayNowResponseEntity>> payNow(PayNowParams params);
}
