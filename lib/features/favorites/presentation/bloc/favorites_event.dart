
abstract class FavoritesEvent {}

class GetFavoritesEvent extends FavoritesEvent {}

class ToggleFavoriteEvent extends FavoritesEvent {
  final String id;
  ToggleFavoriteEvent(this.id);
}
