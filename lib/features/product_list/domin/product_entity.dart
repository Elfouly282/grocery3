 class ProductEntity {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final double? discountPrice;
  final bool isAvailable;

  ProductEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.discountPrice,
    required this.isAvailable,
  });
}