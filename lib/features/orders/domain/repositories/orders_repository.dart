import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/orders/domain/entities/order.dart';

abstract class OrdersRepository {
  Future<Either<ServerException, List<OrderEntity>>> getOrders();
}
