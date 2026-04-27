import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/smart_lists/domain/entities/smart_list.dart';
import 'package:grocery3/features/smart_lists/domain/repositories/smart_lists_repository.dart';

class GetSmartListsUseCase {
  final SmartListsRepository repository;

  GetSmartListsUseCase({required this.repository});

  Future<Either<ServerException, List<SmartListEntity>>> call() async {
    return await repository.getSmartLists();
  }
}
