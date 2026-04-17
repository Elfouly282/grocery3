import '../../../../product_details/domain/entities/product.dart';

abstract class FavoritesEvent {}

class GetFavoritesEvent extends FavoritesEvent {}

class ToggleFavoriteEvent extends FavoritesEvent {
  final int id;
  ToggleFavoriteEvent(this.id);
}
