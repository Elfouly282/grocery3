// domain/entities/category_entity.dart
class CategoryEntity {
  final int id;
  final String name;
  final String slug;

  CategoryEntity({required this.id, required this.name, required this.slug});
}

class RecommendedProductsEntity {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final double finalPrice;
  final bool hasOffer;
  final CategoryEntity category;
  final String features;
  final String recommendationReason;

  RecommendedProductsEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.finalPrice,
    required this.hasOffer,
    required this.category,
    required this.features,
    required this.recommendationReason,
  });
}
