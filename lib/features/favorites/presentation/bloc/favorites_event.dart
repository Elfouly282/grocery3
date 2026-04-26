
abstract class FavoritesEvent {}

class GetFavoritesEvent extends FavoritesEvent {}

class ToggleFavoriteEvent extends FavoritesEvent {
  final int id;
  ToggleFavoriteEvent(this.id);
}
