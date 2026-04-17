import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/payment_card.dart';
import '../repositories/cards_repository.dart';

class GetCardsUseCase {
  final CardsRepository repository;

  GetCardsUseCase({required this.repository});

  Future<Either<Failure, List<PaymentCardEntity>>> call() async {
    return await repository.getCards();
  }
}
