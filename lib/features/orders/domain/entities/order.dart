class OrderEntity {
  final int id;
  final String status;
  final double totalPrice;
  final String createdAt;
  final List<OrderItemEntity> items;

  OrderEntity({
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    required this.items,
  });
}

class OrderItemEntity {
  final int id;
  final String title;
  final int quantity;
  final double? price;
  final double? finalPrice;
  final String imageUrl;
  final String? size;
  final double? rating;
  final int? ratingCount;
  final bool? hasOffer;

  OrderItemEntity({
    required this.id,
    required this.title,
    required this.quantity,
    this.price,
    this.finalPrice,
    required this.imageUrl,
    this.size,
    this.rating,
    this.ratingCount,
    this.hasOffer,
  });
}
