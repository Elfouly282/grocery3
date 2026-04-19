class CategoryEntity {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String imageUrl;
  final int mealsCount;
  final int sortOrder;
  final DateTime createdAt;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.imageUrl,
    required this.mealsCount,
    required this.sortOrder,
    required this.createdAt,
  });
}
