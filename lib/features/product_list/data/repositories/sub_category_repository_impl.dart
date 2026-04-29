import 'package:grocery3/features/product_list/data/data_sources/product_remote_data_source.dart';
import 'package:grocery3/features/product_list/domain/SubCategories/sub_category_repo.dart';
import 'package:grocery3/features/product_list/domain/SubCategories/sub_category_entity.dart';

class SubCategoryRepositoryImpl implements BaseSubCategoryRepo {
  final ProductRemoteDataSource remoteDataSource;

  SubCategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<SubCategoryEntity>> getSubCategory() async {
    final models = await remoteDataSource.getSubCategory();
    return models.map((e) => e as SubCategoryEntity).toList();
  }
}
