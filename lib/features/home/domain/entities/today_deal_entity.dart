// domain/entities/category_entity.dart
class CategoryEntity {
  final int id;
  final String name;

  CategoryEntity({required this.id, required this.name});
}

class DealEntity {
  final int id;
  final String title;
  final String slug;
  final String description;
  final String imageUrl;
  final String offerTitle;
  final double price;
  final double discountPrice;
  final double finalPrice;
  final bool hasOffer;
  final CategoryEntity category;
  final String features;
  final DateTime availableDate;
  final DateTime createdAt;

  DealEntity({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.imageUrl,
    required this.offerTitle,
    required this.price,
    required this.discountPrice,
    required this.finalPrice,
    required this.hasOffer,
    required this.category,
    required this.features,
    required this.availableDate,
    required this.createdAt,
  });
}
