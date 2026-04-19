import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/features/product_list/domain/SubCategories/get_categories_use_case.dart' show GetSubCategoriesUseCase;
import 'package:grocery3/features/product_list/domain/product/get_products_use_case.dart';
import 'package:grocery3/features/product_list/domain/product/product_entity.dart';
import 'package:grocery3/features/product_list/domain/SubCategories/sub_category_entity.dart';
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
      // بنطلب الداتا مباشرة (بدون Either)
      final results = await Future.wait([
        getCategoriesUseCase.call(),
        getProductsUseCase.call(),
      ]);

      // هنا النتائج راجعة List<SubCategoryEntity> و List<ProductEntity> مباشرة
      _categories = results[0] as List<SubCategoryEntity>;
      _products = results[1] as List<ProductEntity>;

      print("API Success! Categories: ${_categories.length}, Products: ${_products.length}");

      emit(ProductListSuccess(
        products: _products,
        categories: _categories,
        selectedCategoryId: _selectedCategoryId,
      ));
    } catch (e) {
      print("Cubit Error: $e");
      emit(ProductListError("حدث خطأ أثناء جلب البيانات: $e"));
    }
  }

  Future<void> getProductsByCategory(String? categoryId) async {
    _selectedCategoryId = categoryId;
    emit(ProductListLoading());

    try {
      final products = await getProductsUseCase.call(
        id: categoryId != null ? int.tryParse(categoryId) : null,
      );

      _products = products;
      
      emit(ProductListSuccess(
        products: _products,
        categories: _categories,
        selectedCategoryId: _selectedCategoryId,
      ));
    } catch (e) {
      emit(ProductListError(e.toString()));
    }
  }
}