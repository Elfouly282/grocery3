
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/api_keys.dart';
import '../models/productModel.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts({String? query});

}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiConsumer api;

  ProductRemoteDataSourceImpl(this.api);

  @override
  Future<List<ProductModel>> getProducts({String? query}) async {
    final response = await api.get(
      '${EndPoint.meals}?search=${query ?? ''}',
    );

    return List<ProductModel>.from(
      response['data'].map((e) => ProductModel.fromJson(e)),
    );
  }
}