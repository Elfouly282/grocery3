import 'package:grocery3/features/product_list/data/data_sources/product_remote_data_source.dart';
import 'package:grocery3/features/product_list/data/models/product_model.dart';
import 'package:grocery3/features/product_list/domain/product/product_repository.dart';

class ProductRepositoryImpl implements BaseProductRepo {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ProductModel>> getProducts() async {
    return await remoteDataSource.getProducts();
  }
}
