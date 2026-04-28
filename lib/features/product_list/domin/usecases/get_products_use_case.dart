import 'package:dartz/dartz.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/product_details/domain/entities/product.dart';
import 'package:grocery3/features/product_details/domain/repositories/product_repository.dart';
import 'package:grocery3/features/product_list/domin/product_entity.dart' hide ProductEntityForCart;

import '../../../product_details/data/repositories/product_repository_impl.dart';

class GetProductsUseCase {
  final ProductListRepository productRepository;

  GetProductsUseCase(this.productRepository);

  Future<Either<ServerException, ProductEntity>> call( {int? categoryId}) async {
    return await productRepository.getProductDetails(
      ,categoryId: categoryId,  
    );
  }
}
