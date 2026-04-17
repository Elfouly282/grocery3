import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/order.dart';

abstract class OrdersRepository {
  Future<Either<Failure, List<OrderEntity>>> getOrders();
}
