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

  factory RecommendedProductsResponseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return RecommendedProductsResponseModel(success: false, message: '', data: []);
    }
    return RecommendedProductsResponseModel(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List?)
          ?.map((i) => RecommendedProductModel.fromJson(i as Map<String, dynamic>))
          .toList() ?? [],
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

  factory RecommendedProductModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return RecommendedProductModel(
        id: 0,
        title: '',
        description: '',
        imageUrl: '',
        price: 0.0,
        finalPrice: 0.0,
        hasOffer: false,
        category: CategoryModel(id: 0, name: '', slug: ''),
        features: '',
        recommendationReason: '',
      );
    }
    return RecommendedProductModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      finalPrice: (json['final_price'] as num?)?.toDouble() ?? 0.0,
      hasOffer: json['has_offer'] as bool? ?? false,
      category: CategoryModel.fromJson(json['category'] as Map<String, dynamic>?),
      features: json['features'] as String? ?? '',
      recommendationReason: json['recommendation_reason'] as String? ?? '',
    );
  }
}

// data/models/category_model.dart
class CategoryModel extends CategoryEntity {
  CategoryModel({required int id, required String name, required String slug})
    : super(id: id, name: name, slug: slug);

  factory CategoryModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return CategoryModel(id: 0, name: '', slug: '');
    }
    return CategoryModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
    );
  }
}
