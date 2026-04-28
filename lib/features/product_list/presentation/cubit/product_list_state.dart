import 'package:grocery3/features/product_list/domain/product/product_entity.dart';
import 'package:grocery3/features/product_list/domain/SubCategories/sub_category_entity.dart';
abstract class ProductListState {}

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