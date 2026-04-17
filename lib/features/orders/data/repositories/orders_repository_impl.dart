import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/order.dart';
import '../../domain/repositories/orders_repository.dart';
import '../datasources/orders_remote_data_source.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource remoteDataSource;

  OrdersRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    try {
      final orders = await remoteDataSource.getOrders();
      return Right(orders);
    } catch (e) {
      if (e is DioException) {
         return Left(ServerFailure(e.response?.data['message'] ?? 'Server Error'));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
