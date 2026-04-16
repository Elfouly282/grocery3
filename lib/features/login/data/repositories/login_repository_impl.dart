// import 'package:dartz/dartz.dart';

// import '../../../../core/connection/network_info.dart';

// import '../../domain/entities/login_entitiy.dart';
// import '../../domain/repositories/login_repository.dart';
// import '../datasources/login_local_data_source.dart';
// import '../datasources/login_remote_data_source.dart';

// class LoginRepositoryImpl extends LoginRepository {
//   final NetworkInfo networkInfo;
//   final LoginRemoteDataSource remoteDataSource;
//   final LoginLocalDataSource localDataSource;
//   LoginRepositoryImpl({
//     required this.remoteDataSource,
//     required this.localDataSource,
//     required this.networkInfo,
//   });
//   @override
//   Future<Either<Failure, loginEntity>> getlogin({
//     required loginParams params,
//   }) async {
//     if (await networkInfo.isConnected!) {
//       try {
//         final remotelogin = await remoteDataSource.getlogin(params);
//         localDataSource.cachelogin(remotelogin);
//         return Right(remotelogin);
//       } on ServerException catch (e) {
//         return Left(Failure(errMessage: e.errorModel.errorMessage));
//       }
//     } else {
//       try {
//         final locallogin = await localDataSource.getLastlogin();
//         return Right(locallogin);
//       } on CacheExeption catch (e) {
//         return Left(Failure(errMessage: e.errorMessage));
//       }
//     }
//   }
// }
