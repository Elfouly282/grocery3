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
      status: json['status_description'] ?? json['status'] ?? '',
      totalPrice: double.tryParse(json['total']?.toString() ?? '0.0') ?? 0.0,
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
    required super.finalPrice,
    required super.imageUrl,
    required super.size,
    required super.rating,
    required super.ratingCount,
    required super.hasOffer,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    final meal = json['meal'] as Map<String, dynamic>?;
    final double originalPrice = double.tryParse(meal?['price']?.toString() ?? json['unit_price']?.toString() ?? '0.0') ?? 0.0;
    final double discountedPrice = double.tryParse(meal?['final_price']?.toString() ?? json['unit_price']?.toString() ?? '0.0') ?? 0.0;
    
    return OrderItemModel(
      id: meal?['id'] ?? json['id'],
      title: meal?['title'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: originalPrice,
      finalPrice: discountedPrice,
      imageUrl: meal?['image_url'] ?? '',
      size: meal?['size'] ?? '',
      rating: double.tryParse(meal?['rating']?.toString() ?? '5.0') ?? 5.0,
      ratingCount: meal?['rating_count'] ?? 0,
      hasOffer: meal?['has_offer'] ?? (originalPrice > discountedPrice && discountedPrice > 0),
    );
  }
}
