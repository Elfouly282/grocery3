import 'package:grocery3/features/product_list/domin/sub_categoriy_entity.dart';
import 'package:grocery3/features/product_list/data/repositories/sub_category_repository_impl.dart';

class GetSubCategoriesUseCase {
  final SubCategoryRepositoryImpl subCategoryRepository;

  GetSubCategoriesUseCase(this.subCategoryRepository);

  Future<List<SubCategoryEntity>> call() async {
    return await subCategoryRepository.getSubCategory();
  }
}
