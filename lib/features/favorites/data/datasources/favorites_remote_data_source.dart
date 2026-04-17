import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/api_keys.dart';
import '../../product_details/data/models/product_model.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<ProductModel>> getFavorites();
  Future<String> toggleFavorite(int id);
}

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final ApiConsumer api;

  FavoritesRemoteDataSourceImpl({required this.api});

  @override
  Future<List<ProductModel>> getFavorites() async {
    final response = await api.get(EndPoint.favorites);
    return (response[ApiKeys.data] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  @override
  Future<String> toggleFavorite(int id) async {
    final response = await api.post("${EndPoint.toggleFavorite}$id/toggle");
    return response[ApiKeys.message];
  }
}
