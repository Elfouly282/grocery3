import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/smart_list.dart';

abstract class SmartListsRepository {
  Future<Either<Failure, List<SmartListEntity>>> getSmartLists();
  Future<Either<Failure, SmartListEntity>> getSmartListDetails(int id);
}
