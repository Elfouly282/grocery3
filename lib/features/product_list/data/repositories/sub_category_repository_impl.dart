import 'package:grocery3/features/product_list/data/data_sources/product_remote_data_source.dart';
import 'package:grocery3/features/product_list/domin/sub_categoriy_entity.dart';

abstract class BaseSubCategoryRepo {
  Future<List<SubCategoryEntity>> getSubCategory();
}

class SubCategoryRepositoryImpl implements BaseSubCategoryRepo {
  final ProductRemoteDataSource remoteDataSource;

  SubCategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<SubCategoryEntity>> getSubCategory() async {
    final models = await remoteDataSource.getSubCategory();
    return models
        .map(
          (e) => SubCategoryEntity(
            id: e.id ?? '',
            name: e.name ?? '',
            imageUrl: e.imageUrl ?? '',
          ),
        )
        .toList();
  }
}
