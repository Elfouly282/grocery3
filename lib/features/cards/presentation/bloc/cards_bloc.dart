import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/features/cards/domain/usecases/get_cards.dart';
import 'package:grocery3/features/cards/presentation/bloc/cards_event.dart';
import 'package:grocery3/features/cards/presentation/bloc/cards_state.dart';
import 'package:grocery3/core/error/failures.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  final GetCardsUseCase getCardsUseCase;

  CardsBloc({required this.getCardsUseCase}) : super(CardsInitial()) {
    on<GetCardsEvent>((event, emit) async {
      emit(CardsLoading());
      final result = await getCardsUseCase();
      result.fold(
        (failure) => emit(CardsError(failure.message)),
        (cards) => emit(CardsLoaded(cards)),
      );
    });
  }
}
