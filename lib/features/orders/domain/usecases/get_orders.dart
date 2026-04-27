import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/orders/domain/entities/order.dart';
import 'package:grocery3/features/orders/domain/repositories/orders_repository.dart';

class GetOrdersUseCase {
  final OrdersRepository repository;

  GetOrdersUseCase({required this.repository});

  Future<Either<ServerException, List<OrderEntity>>> call() async {
    return await repository.getOrders();
  }
}
