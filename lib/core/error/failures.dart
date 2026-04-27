import 'package:equatable/equatable.dart';
import 'error_model.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerException extends Failure {
  final ErrorModel? errModel;
  const ServerException(super.message, {this.errModel});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}
