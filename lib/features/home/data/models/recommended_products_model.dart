// data/models/meal_response_model.dart
import 'package:grocery3/features/home/domain/entities/recommended_products_entity.dart';

class RecommendedProductsResponseModel {
  final bool success;
  final String message;
  final List<RecommendedProductModel> data;

  RecommendedProductsResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RecommendedProductsResponseModel.fromJson(Map<String, dynamic> json) {
    return RecommendedProductsResponseModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((i) => RecommendedProductModel.fromJson(i))
          .toList(),
    );
  }
}

class RecommendedProductModel extends RecommendedProductsEntity {
  RecommendedProductModel({
    required int id,
    required String title,
    required String description,
    required String imageUrl,
    required double price,
    required double finalPrice,
    required bool hasOffer,
    required CategoryModel category,
    required String features,
    required String recommendationReason,
  }) : super(
         id: id,
         title: title,
         description: description,
         imageUrl: imageUrl,
         price: price,
         finalPrice: finalPrice,
         hasOffer: hasOffer,
         category: category,
         features: features,
         recommendationReason: recommendationReason,
       );

  factory RecommendedProductModel.fromJson(Map<String, dynamic> json) {
    return RecommendedProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['image_url'],
      price: (json['price'] as num).toDouble(),
      finalPrice: (json['final_price'] as num).toDouble(),
      hasOffer: json['has_offer'],
      category: CategoryModel.fromJson(json['category']),
      // Splitting the comma-separated string into a list
      features: json['features'],
      recommendationReason: json['recommendation_reason'],
    );
  }
}

// data/models/category_model.dart
class CategoryModel extends CategoryEntity {
  CategoryModel({required int id, required String name, required String slug})
    : super(id: id, name: name, slug: slug);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}
