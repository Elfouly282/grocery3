import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/smart_list.dart';
import '../repositories/smart_lists_repository.dart';

class GetSmartListsUseCase {
  final SmartListsRepository repository;

  GetSmartListsUseCase({required this.repository});

  Future<Either<Failure, List<SmartListEntity>>> call() async {
    return await repository.getSmartLists();
  }
}
