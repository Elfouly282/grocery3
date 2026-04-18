import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/cards/domain/entities/payment_card.dart';
import 'package:grocery3/features/cards/domain/repositories/cards_repository.dart';

class GetCardsUseCase {
  final CardsRepository repository;

  GetCardsUseCase({required this.repository});

  Future<Either<Failure, List<PaymentCardEntity>>> call() async {
    return await repository.getCards();
  }
}
