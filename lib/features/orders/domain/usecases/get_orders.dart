import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/order.dart';
import '../repositories/orders_repository.dart';

class GetOrdersUseCase {
  final OrdersRepository repository;

  GetOrdersUseCase({required this.repository});

  Future<Either<Failure, List<OrderEntity>>> call() async {
    return await repository.getOrders();
  }
}
