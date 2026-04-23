import 'package:dio/dio.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/api_keys.dart';

abstract class AddSmartListRemoteDataSource {
  Future<void> createSmartList({
    required String name,
    String? description,
    String? image,
    required List<int> mealIds,
  });
}
class AddSmartListRemoteDataSourceImpl implements AddSmartListRemoteDataSource {
  final ApiConsumer api;

  AddSmartListRemoteDataSourceImpl(this.api);

  @override
  Future<void> createSmartList({
    required String name,
    String? description,
    String? image,
    required List<int> mealIds,
  }) async {
    final formData = FormData();

    formData.fields.add(MapEntry("name", name));
    formData.fields.add(MapEntry("description", description ?? ""));

    for (int i = 0; i < mealIds.length; i++) {
      formData.fields.add(
        MapEntry("meal_ids[$i]", mealIds[i].toString()),
      );
    }

    await api.post(
      EndPoint.smart_list,
      data: formData,
    );
  }
}