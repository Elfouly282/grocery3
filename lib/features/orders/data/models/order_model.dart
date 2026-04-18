import '../../domain/entities/order.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.status,
    required super.totalPrice,
    required super.createdAt,
    required super.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      status: json['status'] ?? '',
      totalPrice: (json['total_price'] as num?)?.toDouble() ?? 0.0,
      createdAt: json['created_at'] ?? '',
      items: (json['items'] as List?)
              ?.map((e) => OrderItemModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class OrderItemModel extends OrderItemEntity {
  OrderItemModel({
    required super.id,
    required super.title,
    required super.quantity,
    required super.price,
    required super.imageUrl,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'],
      title: json['title'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      imageUrl: json['image_url'] ?? '',
    );
  }
}
