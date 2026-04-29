import 'package:dartz/dartz.dart';
import 'package:grocery3/features/home/domain/entities/category_entity.dart';

abstract class CategoryRepo {
  Future<Either<String, List<CategoryEntity>>> getAllCategories();
}
