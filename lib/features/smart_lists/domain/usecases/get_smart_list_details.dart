import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/smart_list.dart';
import '../repositories/smart_lists_repository.dart';

class GetSmartListDetailsUseCase {
  final SmartListsRepository repository;

  GetSmartListDetailsUseCase({required this.repository});

  Future<Either<Failure, SmartListEntity>> call(int id) async {
    return await repository.getSmartListDetails(id);
  }
}
