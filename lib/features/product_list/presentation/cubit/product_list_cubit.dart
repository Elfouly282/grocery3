import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/features/product_details/domain/entities/product.dart';
import 'package:grocery3/features/product_list/domin/product_entity.dart' hide ProductEntityForCart;
import 'package:grocery3/features/product_list/domin/usecases/get_products_use_case.dart';
import 'package:grocery3/features/product_list/domin/usecases/get_sub_categories_use_case.dart';
import 'package:grocery3/features/product_list/domin/sub_categoriy_entity.dart';
import 'package:grocery3/features/product_list/presentation/cubit/product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final GetProductsUseCase getProductsUseCase;
  final GetSubCategoriesUseCase getCategoriesUseCase;

  ProductListCubit(this.getProductsUseCase, this.getCategoriesUseCase)
    : super(ProductListInitial());

  List<SubCategoryEntity> _categories = [];
  List<ProductEntity> _products = [];
  String? _selectedCategoryId;

  Future<void> getInitialData() async {
    emit(ProductListLoading());

    try {
      final results = await Future.wait([
        getCategoriesUseCase.call(),
        getProductsUseCase.call(),
      ]);

      _categories = results[0] as List<SubCategoryEntity>;
      _products = results[1] as List<ProductEntity>;

      print(
        "API Success! Categories: ${_categories.length}, Products: ${_products.length}",
      );

      emit(
        ProductListSuccess(
          products: _products,
          categories: _categories,
          selectedCategoryId: _selectedCategoryId,
        ),
      );
    } catch (e) {
      emit(ProductListError("error : $e"));
    }
  }

  Future<void> getProductsByCategory(String? categoryId) async {
    _selectedCategoryId = categoryId;
    emit(ProductListLoading());

    try {
      final products = await getProductsUseCase.call(
        categoryId: categoryId != null ? int.tryParse(categoryId) : null,
      );

      _products = products as List<ProductEntity>;

      emit(
        ProductListSuccess(
          products: _products,
          categories: _categories,
          selectedCategoryId: _selectedCategoryId,
        ),
      );
    } catch (e) {
      emit(ProductListError(e.toString()));
    }
  }
}
