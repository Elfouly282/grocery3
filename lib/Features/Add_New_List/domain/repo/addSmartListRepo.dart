abstract class SmartListRepository {
  Future<void> createSmartList({
    required String name,
    String? description,
    String? image,
    required List<int> mealIds,
  });
}