import 'package:grocery3/features/product_details/domain/entities/product.dart';
import 'package:grocery3/features/product_list/domin/product_entity.dart';
import 'package:grocery3/features/product_list/domin/sub_categoriy_entity.dart';

class ProductListState {}

class ProductListInitial extends ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListSuccess extends ProductListState {
  final List<ProductEntity> products;
  final List<SubCategoryEntity> categories;
  final String? selectedCategoryId;

  ProductListSuccess({
    required this.products,
    required this.categories,
    this.selectedCategoryId,
  });
}

class ProductListError extends ProductListState {
  final String message;

  ProductListError(this.message);
}
