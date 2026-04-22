import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/api/api_keys.dart';
import 'package:grocery3/features/home/data/models/category_model.dart';
import 'package:grocery3/features/home/data/models/recommended_products_model.dart';
import '../models/today_deals_model.dart';

class RemoteDataSources {
  final ApiConsumer api;
  RemoteDataSources({required this.api});
  Future<RecommendedProductsResponseModel> getAllRecommendedProducts() async {
    final response = await api.get(EndPoint.getAllRecommendedProducts);
    return RecommendedProductsResponseModel.fromJson(response);
  }

  Future<DealResponseModel> getAllTodayDeals() async {
    final response = await api.get(EndPoint.getAllTodayDeals);
    return DealResponseModel.fromJson(response);
  }

  Future<CategoryModelResponseModel> getAllCategories() async {
    final response = await api.get(EndPoint.getAllCategory);
    return CategoryModelResponseModel.fromJson(response);
  }
}
