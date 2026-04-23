

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/Add_New_List/presentation/cubit/produts/product_state.dart';

import '../../../domain/entity/productEntity.dart';
import '../../../domain/useCase/productUseCase.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductsUseCase getProductsUseCase;

  ProductCubit(this.getProductsUseCase) : super(ProductInitial());

  List<ProductEntity> _all = [];

  Future<void> getProducts() async {
    emit(ProductLoading());

    final result = await getProductsUseCase();

    result.fold(
          (error) => emit(ProductError(error.errModel.message!)),
          (data) {
        _all = data;
        emit(ProductLoaded(data));
      },
    );
  }

  void search(String query) {
    if (state is! ProductLoaded) return;

    final filtered = query.isEmpty
        ? _all
        : _all.where((e) =>
        e.title.toLowerCase().contains(query.toLowerCase())).toList();

    emit(ProductLoaded(filtered));
  }
}