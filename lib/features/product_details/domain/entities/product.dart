
class ProductEntity {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final double? discountPrice;
  final double finalPrice;
  final bool hasOffer;
  final double rating;
  final int ratingCount;
  final String size;
  final String brand;
  final String includes;
  final String howToUse;
  final String features;
  final bool inStock;
  final String categoryName;
  final bool isFavorite;
  final List<ProductEntity> similarProducts;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.discountPrice,
    required this.finalPrice,
    required this.hasOffer,
    required this.rating,
    required this.ratingCount,
    required this.size,
    required this.brand,
    required this.includes,
    required this.howToUse,
    required this.features,
    required this.inStock,
    required this.categoryName,
    this.isFavorite = false,
    this.similarProducts = const [],
  });
}
