
import '../../domain/entities/product.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.price,
    super.discountPrice,
    required super.finalPrice,
    required super.hasOffer,
    required super.rating,
    required super.ratingCount,
    required super.size,
    required super.brand,
    required super.includes,
    required super.howToUse,
    required super.features,
    required super.inStock,
    required super.categoryName,
    super.similarProducts,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'] ?? '',
      imageUrl: json['image_url'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPrice: json['discount_price'] != null ? (json['discount_price'] as num).toDouble() : null,
      finalPrice: (json['final_price'] as num?)?.toDouble() ?? 0.0,
      hasOffer: json['has_offer'] ?? false,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      ratingCount: json['rating_count'] ?? 0,
      size: json['size'] ?? '',
      brand: json['brand'] ?? '',
      includes: json['includes'] ?? '',
      howToUse: json['how_to_use'] ?? '',
      features: json['features'] ?? '',
      inStock: json['in_stock'] ?? false,
      categoryName: json['category'] != null ? json['category']['name'] : '',
      similarProducts: json['similar_products'] != null
          ? List<ProductModel>.from(json['similar_products'].map((x) => ProductModel.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'price': price,
      'discount_price': discountPrice,
      'final_price': finalPrice,
      'has_offer': hasOffer,
      'rating': rating,
      'rating_count': ratingCount,
      'size': size,
      'brand': brand,
      'includes': includes,
      'how_to_use': howToUse,
      'features': features,
      'in_stock': inStock,
      'category': {'name': categoryName},
      'similar_products': similarProducts.map((x) => (x as ProductModel).toJson()).toList(),
    };
  }
}
