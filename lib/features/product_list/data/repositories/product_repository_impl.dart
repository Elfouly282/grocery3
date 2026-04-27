import 'package:grocery3/features/product_details/domain/entities/product.dart';
import 'package:grocery3/features/product_list/data/data_sources/product_remote_data_source.dart';

abstract class BaseProductRepo {
  Future<List<ProductEntity>> getProducts();
}

class ProductRepositoryImpl implements BaseProductRepo {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ProductEntity>> getProducts() async {
    try {
      final models = await remoteDataSource.getProducts();
      return models
          .map(
            (e) => ProductEntity(
              id: e.id,
              title: e.title,
              imageUrl: e.imageUrl ?? '',
              price: 0.0,
              description: e.description ?? '',
              finalPrice:  0.0,
              hasOffer: false ,
              rating: 0.0, 
              ratingCount: 0,
              size: '',
              brand: '',
              includes: '',
              howToUse: '',
              features: '',
              inStock: false,
              categoryName: '',
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}
