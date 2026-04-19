// data/models/product_model.dart
// import 'package:grocery3/core/api/api_keys.dart';
import 'package:grocery3/features/product_list/domain/product/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.name,
    required super.price,
    super.oldPrice,
    super.weight,
    super.rating,
    required super.imageUrl,
    super.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: (json['id'] ?? '').toString(),

      name: json['title']?.toString() ?? 'No Name',

      price: (json['price'] as num? ?? 0).toDouble(),

      oldPrice: json['discount_price'] != null
          ? (json['discount_price'] as num).toDouble()
          : null,

      weight: json['size']?.toString() ?? '',

      rating: (json['rating'] as num? ?? 0).toDouble(),

      imageUrl: json['image_url']?.toString() ?? '',

      isFavorite: json['is_favorited'] ?? false,
    );
  }
}
