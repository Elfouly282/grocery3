
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_product_details.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;

  ProductBloc({required this.getProductDetailsUseCase}) : super(ProductInitial()) {
    on<GetProductDetailsEvent>((event, emit) async {
      emit(ProductLoading());
      final result = await getProductDetailsUseCase(event.id);
      result.fold(
        (failure) => emit(ProductError(failure.message)),
        (product) => emit(ProductLoaded(product)),
      );
    });
  }
}
