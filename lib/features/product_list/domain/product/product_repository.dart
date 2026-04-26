import 'package:grocery3/features/product_list/data/models/product_model.dart';

abstract class BaseProductRepo {
  Future<List<ProductModel>> getProducts();
}