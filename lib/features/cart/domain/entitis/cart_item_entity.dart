// domain/entities/cart_item.dart
class CartItem {
  final int id;
  final String name;
  final String image;
  final double price;
  final double? originalPrice;
  final int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.originalPrice,
    required this.quantity,
  });

  CartItem copyWith({
    int? id,
    String? name,
    String? image,
    double? price,
    double? originalPrice,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      quantity: quantity ?? this.quantity,
    );
  }
}

class Cart {
  final List<CartItem> items;
  final double total;

  Cart({
    required this.items,
    required this.total,
  });
}
