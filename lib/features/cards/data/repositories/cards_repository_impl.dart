import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/cards/domain/entities/payment_card.dart';
import 'package:grocery3/features/cards/domain/repositories/cards_repository.dart';
import 'package:grocery3/features/cards/data/datasources/cards_remote_data_source.dart';

class CardsRepositoryImpl implements CardsRepository {
  final CardsRemoteDataSource remoteDataSource;

  CardsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PaymentCardEntity>>> getCards() async {
    try {
      final cards = await remoteDataSource.getCards();
      return Right(cards);
    } catch (e) {
      if (e is DioException) {
         return Left(ServerFailure(e.response?.data['message'] ?? 'Server Error'));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
