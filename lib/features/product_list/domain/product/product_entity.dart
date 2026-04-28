class ProductEntity {
  final int id;
  final String name;
  final double price;
  final double? oldPrice;
  final String? weight;
  final double? rating;
  final String imageUrl;
  final bool isFavorite;

  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    this.oldPrice,
    this.weight,
    this.rating,
    required this.imageUrl,
    this.isFavorite = false,
  });
}