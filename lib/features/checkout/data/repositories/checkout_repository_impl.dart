import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/checkout/data/datasources/checkout_remote_data_source.dart';
import 'package:grocery3/features/checkout/data/models/pay_now_request_model.dart';
import 'package:grocery3/features/checkout/domain/entities/pay_now_response_entity.dart';
import 'package:grocery3/features/checkout/domain/repositories/checkout_repository.dart';
import 'package:grocery3/features/checkout/domain/usecases/pay_now_usecase.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final CheckoutRemoteDataSource remoteDataSource;

  CheckoutRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, PayNowResponseEntity>> payNow(PayNowParams params) async {
    try {
      final request = PayNowRequestModel.fromParams(params);
      final response = await remoteDataSource.payNow(request);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure(e.response?.data['message']?.toString() ?? 'Server Error'),
        );
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
