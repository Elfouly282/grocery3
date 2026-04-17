import '../../domain/entities/payment_card.dart';

abstract class CardsState {}

class CardsInitial extends CardsState {}

class CardsLoading extends CardsState {}

class CardsLoaded extends CardsState {
  final List<PaymentCardEntity> cards;
  CardsLoaded(this.cards);
}

class CardsError extends CardsState {
  final String message;
  CardsError(this.message);
}
