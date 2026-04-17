import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/api_keys.dart';
import '../models/order_model.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getOrders();
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final ApiConsumer api;

  OrdersRemoteDataSourceImpl({required this.api});

  @override
  Future<List<OrderModel>> getOrders() async {
    final response = await api.get(EndPoint.orders);
    return (response[ApiKeys.data] as List)
        .map((e) => OrderModel.fromJson(e))
        .toList();
  }
}
