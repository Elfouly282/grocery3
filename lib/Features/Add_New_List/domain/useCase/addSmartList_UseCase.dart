  import '../repo/addSmartListRepo.dart';

  class AddSmartListUseCase {
    final SmartListRepository repo;

    AddSmartListUseCase({required this.repo});

    Future<void> call({
      required String name,
      String? description,
      String? image,
      required List<int> mealIds,
    }) {
      return repo.createSmartList(
        name: name,
        description: description,
        image: image,
        mealIds: mealIds,
      );
    }
  }