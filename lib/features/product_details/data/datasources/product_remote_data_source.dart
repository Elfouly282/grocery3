import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/api_keys.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getProductDetails(int id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiConsumer api;

  ProductRemoteDataSourceImpl(this.api);

  @override
  Future<ProductModel> getProductDetails(int id) async {
    final response = await api.get('${EndPoint.meals}/$id');
    return ProductModel.fromJson(response['data']);
  }
}
