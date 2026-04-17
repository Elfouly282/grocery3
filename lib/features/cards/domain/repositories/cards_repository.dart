import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/payment_card.dart';

abstract class CardsRepository {
  Future<Either<Failure, List<PaymentCardEntity>>> getCards();
}
