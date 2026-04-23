import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/exception.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/data/models/categories_model/categories_model.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/entities/categores_entity.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/entities/sub_categores_item_entity.dart';

abstract class CategoryRepo {
  Future<Either<ServerException, List<CategoriesItemEntity>>> getCategories();
  Future<Either<ServerException, List<SubCategoresItemEntity>>>
  getSubCategories(String id);
}
