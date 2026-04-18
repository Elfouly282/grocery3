import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/smart_lists/domain/entities/smart_list.dart';

abstract class SmartListsRepository {
  Future<Either<Failure, List<SmartListEntity>>> getSmartLists();
  Future<Either<Failure, SmartListEntity>> getSmartListDetails(int id);
}
