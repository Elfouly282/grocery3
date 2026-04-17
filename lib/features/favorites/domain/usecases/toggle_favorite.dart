import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repositories/favorites_repository.dart';

class ToggleFavoriteUseCase {
  final FavoritesRepository repository;

  ToggleFavoriteUseCase({required this.repository});

  Future<Either<Failure, String>> call(int id) async {
    return await repository.toggleFavorite(id);
  }
}
