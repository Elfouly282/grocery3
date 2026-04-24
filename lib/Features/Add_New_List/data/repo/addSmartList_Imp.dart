
import 'dart:io';

import '../../domain/repo/addSmartListRepo.dart';
import '../datasources/addSmartListDataSource.dart';

class AddSmartListRepoImpl implements SmartListRepository {
  final AddSmartListRemoteDataSource remote;

  AddSmartListRepoImpl({required this.remote});

  @override
  Future<void> createSmartList({
    required String name,
    String? description,
    File? image,
    required List<int> mealIds,
  }) {
    return remote.createSmartList(
      name: name,
      description: description,
      image: image,
      mealIds: mealIds,
    );
  }
}