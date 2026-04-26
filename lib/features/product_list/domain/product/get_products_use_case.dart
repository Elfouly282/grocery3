import 'package:grocery3/features/product_list/data/models/product_model.dart';
import 'package:grocery3/features/product_list/domain/product/product_repository.dart';

class GetProductsUseCase {
  final BaseProductRepo repo;

  GetProductsUseCase(this.repo);

  Future<List<ProductModel>> call({int? id}) {
    return repo.getProducts();
  }
}