import 'package:grocery3/features/product_details/domain/entities/product.dart';
import 'package:grocery3/features/product_list/data/repositories/product_repository_impl.dart';

class GetProductsUseCase {
  final ProductRepositoryImpl productRepository;

  GetProductsUseCase(this.productRepository);

  Future<List<ProductEntity>> call() async {
    return await productRepository.getProducts();
  }
}
