import 'package:grocery3/features/product_list/domain/SubCategories/sub_category_repo.dart';
import 'package:grocery3/features/product_list/domain/SubCategories/sub_category_entity.dart';

class GetSubCategoriesUseCase {
  final BaseSubCategoryRepo repository;

  GetSubCategoriesUseCase(this.repository);

  Future<List<SubCategoryEntity>> call() async {
    return await repository.getSubCategory();
  }
}
