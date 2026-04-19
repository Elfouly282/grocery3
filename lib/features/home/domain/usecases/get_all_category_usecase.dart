import 'package:dartz/dartz.dart';
import 'package:grocery3/features/home/domain/entities/category_entity.dart';
import 'package:grocery3/features/home/domain/repository/category_repo.dart';

class GetAllCategoryUsecase {
  final CategoryRepo categoryRepo;

  GetAllCategoryUsecase({required this.categoryRepo});

  Future<Either<String, List<CategoryEntity>>> call() async {
    return await categoryRepo.getAllCategories();
  }
}
