import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_cards.dart';
import 'cards_event.dart';
import 'cards_state.dart';

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
