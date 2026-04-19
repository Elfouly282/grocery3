// import 'package:grocery3/core/api/api_keys.dart';
import 'package:grocery3/features/product_list/domain/SubCategories/sub_category_entity.dart';

class SubSubCategoryModel extends SubCategoryEntity {
  SubSubCategoryModel({
    required super.id,
    required super.name,
    required super.imageUrl,
  });

  factory SubSubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubSubCategoryModel(
      id: (json['id'] ?? '').toString(),
      name: json['name']?.toString() ?? 'No Name',
      imageUrl: json['image_url']?.toString() ?? '',
    );
  }
}
