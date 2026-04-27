import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grocery3/core/error/error_model.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/orders/domain/entities/order.dart';
import 'package:grocery3/features/orders/domain/repositories/orders_repository.dart';
import 'package:grocery3/features/orders/data/datasources/orders_remote_data_source.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource remoteDataSource;

  OrdersRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ServerException, List<OrderEntity>>> getOrders() async {
    try {
      final orders = await remoteDataSource.getOrders();
      return Right(orders);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerException(
            e.response?.data['message'] ?? 'Server Error',
            errModel: ErrorModel(
              message: e.response?.data['message'] ?? 'Server Error',
            ),
          ),
        );
      }
      return Left(
        ServerException(
          e.toString(),
          errModel: ErrorModel(message: e.toString()),
        ),
      );
    }
  }
}
