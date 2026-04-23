import 'package:dartz/dartz.dart';
import 'package:grocery3/core/connection/network_info.dart';
import 'package:grocery3/core/error/exception.dart';
import 'package:grocery3/core/helper/security/security_helper.dart';
import 'package:grocery3/features/login/data/datasources/login_remote_data_source.dart';
import 'package:grocery3/features/login/domain/entities/user_entity.dart';
import 'package:grocery3/features/login/domain/repositories/login_repo.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  LoginRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });
  @override
  Future<Either<String, AuthResult>> login({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteData = await remoteDataSource.login(
          email: email,
          password: password,
        );
        SecureStorageService().setRefreshToken(remoteData.token);
        return Right(remoteData);
      } on ServerException catch (e) {
        return Left(e.errModel.message.toString());
      }
    } else {
      return Left('No internet connection');
    }
  }
}
