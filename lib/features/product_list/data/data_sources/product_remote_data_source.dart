import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/api/api_keys.dart';
import 'package:grocery3/features/product_list/data/models/product_model.dart';
import 'package:grocery3/features/product_list/data/models/category_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts({int? categoryId});
  Future<List<SubSubCategoryModel>> getSubCategory();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiConsumer apiConsumer;

  ProductRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<ProductModel>> getProducts({int? categoryId}) async {
    final response = await apiConsumer.get(
      EndPoint.products,
      queryParameters: categoryId != null ? {'category_id': categoryId} : null,
    );

    if (response is Map<String, dynamic> && response.containsKey('data')) {
      final List data = response['data'] as List;
      return data.map((e) => ProductModel.fromJson(e)).toList();
    }

    return [];
  }

  @override
  Future<List<SubSubCategoryModel>> getSubCategory() async {
    try {
      final response = await apiConsumer.get(EndPoint.subCategories);
      if (response is Map<String, dynamic> && response.containsKey('data')) {
        final List data = response['data'] as List;
        return data.map((e) => SubSubCategoryModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}

