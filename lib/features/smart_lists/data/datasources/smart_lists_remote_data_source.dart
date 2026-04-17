import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/api_keys.dart';
import '../models/smart_list_model.dart';

abstract class SmartListsRemoteDataSource {
  Future<List<SmartListModel>> getSmartLists();
  Future<SmartListModel> getSmartListDetails(int id);
}

class SmartListsRemoteDataSourceImpl implements SmartListsRemoteDataSource {
  final ApiConsumer api;

  SmartListsRemoteDataSourceImpl({required this.api});

  @override
  Future<List<SmartListModel>> getSmartLists() async {
    final response = await api.get(EndPoint.smartLists);
    return (response[ApiKeys.data] as List)
        .map((e) => SmartListModel.fromJson(e))
        .toList();
  }

  @override
  Future<SmartListModel> getSmartListDetails(int id) async {
    final response = await api.get("${EndPoint.smartLists}/$id");
    return SmartListModel.fromJson(response[ApiKeys.data]);
  }
}
