import 'package:grocery3/features/smart_lists/domain/entities/smart_list.dart';
import 'package:grocery3/features/product_details/data/models/product_model.dart';
import 'package:grocery3/features/product_details/domain/entities/product.dart';

class SmartListModel extends SmartListEntity {
  SmartListModel({
    required super.id,
    required super.title,
    required super.icon,
    required super.itemsCount,
    super.products,
  });

  factory SmartListModel.fromJson(dynamic json) {
    print(json);
    return SmartListModel(
      id: json['id'],
      title: json['title'] ?? '',
      icon: json['icon'] ?? '',
      itemsCount: json['items_count'] ?? 0,
      products: json['products'] != null
          ? List<ProductModel>.from(
              json['products'].map((x) => ProductModel.fromJson(x)))
          : [],
    );
  }
}
