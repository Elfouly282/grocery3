import 'package:grocery3/features/product_details/domain/entities/product.dart';

class SmartListEntity {
  final int id;
  final String title;
  final String icon;
  final int itemsCount;
  final List<ProductEntity> products;

  SmartListEntity({
    required this.id,
    required this.title,
    required this.icon,
    required this.itemsCount,
    this.products = const [],
  });
}
