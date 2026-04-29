import 'package:grocery3/features/product_list/domain/SubCategories/sub_category_entity.dart';

abstract class BaseSubCategoryRepo {
  Future<List<SubCategoryEntity>> getSubCategory();
}
