// data/models/category_model.dart

import 'package:grocery3/features/home/domain/entities/category_entity.dart';

class CategoryModelResponseModel {
  final bool success;
  final String message;
  final List<HomeCategoryModel> data;

  CategoryModelResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CategoryModelResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryModelResponseModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((i) => HomeCategoryModel.fromJson(i))
          .toList(),
    );
  }
}

class HomeCategoryModel extends CategoryEntity {
  const HomeCategoryModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.description,
   required super.imageUrl,
    required super.mealsCount,
    required super.sortOrder,
    required super.createdAt,
  });

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String? ?? '',
      mealsCount: json['meals_count'] as int? ?? 0,
      sortOrder: json['sort_order'] as int? ?? 0,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
