import 'dart:io';

abstract class SmartListRepository {
  Future<void> createSmartList({
    required String name,
    String? description,
    File? image,
    required List<int> mealIds,
  });
}