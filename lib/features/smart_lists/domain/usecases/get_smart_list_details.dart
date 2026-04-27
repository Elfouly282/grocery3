import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/smart_lists/domain/entities/smart_list.dart';
import 'package:grocery3/features/smart_lists/domain/repositories/smart_lists_repository.dart';

class GetSmartListDetailsUseCase {
  final SmartListsRepository repository;

  GetSmartListDetailsUseCase({required this.repository});

  Future<Either<ServerException, SmartListEntity>> call(int id) async {
    return await repository.getSmartListDetails(id);
  }
}
