import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_favorites.dart';
import '../../domain/usecases/toggle_favorite.dart';
import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoritesUseCase getFavoritesUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  FavoritesBloc({
    required this.getFavoritesUseCase,
    required this.toggleFavoriteUseCase,
  }) : super(FavoritesInitial()) {
    on<GetFavoritesEvent>((event, emit) async {
      emit(FavoritesLoading());
      final result = await getFavoritesUseCase();
      result.fold(
        (failure) => emit(FavoritesError(failure.message)),
        (favorites) => emit(FavoritesLoaded(favorites)),
      );
    });

    on<ToggleFavoriteEvent>((event, emit) async {
      final result = await toggleFavoriteUseCase(event.id);
      result.fold(
        (failure) => emit(FavoritesError(failure.message)),
        (message) {
          emit(ToggleFavoriteSuccess(message));
          add(GetFavoritesEvent()); // Refresh list
        },
      );
    });
  }
}
