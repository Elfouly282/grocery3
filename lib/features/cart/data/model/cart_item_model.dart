import 'package:grocery3/features/cart/domain/entitis/cart_item_entity.dart';

class CartItemModel extends CartItem {
  CartItemModel({
    required super.id,
    required super.name,
    required super.image,
    required super.price,
    super.originalPrice,
    required super.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic>? json) {
    // Access the nested 'meal' object safely
    final meal = json?['meal'] as Map<String, dynamic>?;

    return CartItemModel(
      id: json?['id'] as int? ?? 0,
      // Map 'title' from meal to 'name'
      name: meal?['title'] as String? ?? 'Unknown',
      // Map 'image_url' from meal to 'image'
      image: meal?['image_url'] as String? ?? '',
      // Map 'unit_price' to 'price'
      price: (json?['unit_price'] as num? ?? 0.0).toDouble(),
      // Map the original 'price' from meal to 'originalPrice'
      originalPrice:
          meal?['price'] != null ? (meal!['price'] as num).toDouble() : null,
      quantity: json?['quantity'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'meal': {'title': name, 'image_url': image, 'price': originalPrice},
      'unit_price': price,
      'quantity': quantity,
    };
  }
}

class CartModel extends Cart {
  final int id;
  final double subtotal;
  final double tax;
  final double discount;
  final bool isEmpty;

  CartModel({
    required this.id,
    required super.items,
    required super.total,
    required this.subtotal,
    required this.tax,
    required this.discount,
    required this.isEmpty,
  });

  factory CartModel.fromJson(Map<String, dynamic>? json) {
    // Navigate into the 'data' key safely
    final data = json?['data'] as Map<String, dynamic>?;

    // Extract items list or default to empty list
    final itemsList = data?['items'] as List? ?? [];

    return CartModel(
      id: data?['id'] as int? ?? 0,
      items:
          itemsList
              .map(
                (item) => CartItemModel.fromJson(item as Map<String, dynamic>?),
              )
              .toList(),
      subtotal: (data?['subtotal'] as num? ?? 0.0).toDouble(),
      tax: (data?['tax'] as num? ?? 0.0).toDouble(),
      discount: (data?['discount'] as num? ?? 0.0).toDouble(),
      total: (data?['total'] as num? ?? 0.0).toDouble(),
      isEmpty: data?['is_empty'] as bool? ?? true,
    );
  }
}
