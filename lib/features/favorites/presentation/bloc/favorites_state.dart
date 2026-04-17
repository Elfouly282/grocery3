import '../../../../product_details/domain/entities/product.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<ProductEntity> favorites;
  FavoritesLoaded(this.favorites);
}

class FavoritesError extends FavoritesState {
  final String message;
  FavoritesError(this.message);
}

class ToggleFavoriteSuccess extends FavoritesState {
  final String message;
  ToggleFavoriteSuccess(this.message);
}
