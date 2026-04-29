import 'package:grocery3/features/Categories%20&%20SubCategories/data/models/categories_model/categories_model.dart';

class CategoriesItemEntity {
  int? id;
  String? name;
  String? slug;
  String? description;
  dynamic imageUrl;
  int? mealsCount;
  int? sortOrder;
  DateTime? createdAt;

  CategoriesItemEntity({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.imageUrl,
    this.mealsCount,
    this.sortOrder,
    this.createdAt,
  });
  factory CategoriesItemEntity.fromModel(CategoriesItemModel model) {
    return CategoriesItemEntity(
      id: model.id,
      name: model.name,
      slug: model.slug,
      description: model.description,
      imageUrl: model.imageUrl,
      mealsCount: model.mealsCount,
      sortOrder: model.sortOrder,
      createdAt: model.createdAt,
    );
  }
}
