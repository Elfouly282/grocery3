import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/cards/domain/entities/payment_card.dart';

abstract class CardsRepository {
  Future<Either<Failure, List<PaymentCardEntity>>> getCards();
}
