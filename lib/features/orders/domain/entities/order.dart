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
  final double price;
  final String imageUrl;

  OrderItemEntity({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });
}
