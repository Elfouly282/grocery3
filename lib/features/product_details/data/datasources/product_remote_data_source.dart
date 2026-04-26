
import 'package:grocery3/core/api/dio_consumer.dart';

import '../../../../core/api/api_consumer.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getProductDetails(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiConsumer api;

  ProductRemoteDataSourceImpl({required this.api});


  @override
  Future<ProductModel> getProductDetails(String id) async {
    final response = await api.get('/meals/$id');
    return ProductModel.fromJson(response['data']);
  }
}
