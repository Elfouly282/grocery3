import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/favorites/domain/repositories/favorites_repository.dart';

class ToggleFavoriteUseCase {
  final FavoritesRepository repository;

  ToggleFavoriteUseCase({required this.repository});

  Future<Either<ServerException, String>> call(int id) async {
    return await repository.toggleFavorite(id);
  }
}
