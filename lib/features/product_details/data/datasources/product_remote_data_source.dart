import 'package:grocery3/core/api/api_keys.dart';
import 'package:grocery3/core/api/api_consumer.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getProductDetails(int id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiConsumer api;

  ProductRemoteDataSourceImpl({required this.api});

  @override
  Future<ProductModel> getProductDetails(int id) async {
    final response = await api.get('${EndPoint.meals}/$id');
    return ProductModel.fromJson(response['data']);
  }
}
