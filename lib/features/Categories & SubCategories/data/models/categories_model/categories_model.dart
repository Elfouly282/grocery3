class CategoriesItemModel {
  int? id;
  String? name;
  String? slug;
  String? description;
  dynamic imageUrl;
  int? mealsCount;
  int? sortOrder;
  DateTime? createdAt;

  CategoriesItemModel({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.imageUrl,
    this.mealsCount,
    this.sortOrder,
    this.createdAt,
  });

  factory CategoriesItemModel.fromJson(Map<String, dynamic> json) {
    return CategoriesItemModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as dynamic,
      mealsCount: json['meals_count'] as int?,
      sortOrder: json['sort_order'] as int?,
      createdAt:
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'image_url': imageUrl,
      'meals_count': mealsCount,
      'sort_order': sortOrder,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
