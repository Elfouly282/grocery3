// presentation/cubit/cart_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/features/cart/domain/usecase/get_cart_usecase.dart';
import 'package:grocery3/features/cart/domain/usecase/remove_from_cart_usecase.dart';
import 'package:grocery3/features/cart/domain/usecase/update_cart_item_usecase.dart';

import 'package:grocery3/features/cart/presentation/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase getCartUseCase;
  final UpdateCartItemUseCase updateCartItemUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;

  CartCubit({
    required this.getCartUseCase,
    required this.updateCartItemUseCase,
    required this.removeFromCartUseCase,
  }) : super(CartInitial());

  void loadCart() async {
    emit(CartLoading());
    final result = await getCartUseCase.call();
    result.fold(
      (error) => emit(CartError(message: error)),
      (cart) => emit(CartLoaded(cart)),
    );
  }

  void updateQuantity({
    required int cartItemId,
    required int newQuantity,
  }) async {
    if (state is CartLoaded) {
      final currentCart = (state as CartLoaded).cart;
      emit(CartItemUpdating(cart: currentCart, updatingItemId: cartItemId));
      
      final result = await updateCartItemUseCase.call(
        cartItemId: cartItemId,
        quantity: newQuantity,
      );
      
      result.fold(
        (error) => emit(CartError(message: error)),
        (cart) => emit(CartLoaded(cart)),
      );
    }
  }

  void incrementQuantity(int cartItemId, int currentQuantity) {
    updateQuantity(cartItemId: cartItemId, newQuantity: currentQuantity + 1);
  }

  void decrementQuantity(int cartItemId, int currentQuantity) {
    if (currentQuantity > 1) {
      updateQuantity(cartItemId: cartItemId, newQuantity: currentQuantity - 1);
    }
  }

  void removeItem(int cartItemId) async {
    if (state is CartLoaded) {
      final currentCart = (state as CartLoaded).cart;
      emit(CartItemRemoving(cart: currentCart, removingItemId: cartItemId));
      
      final result = await removeFromCartUseCase.call(cartItemId: cartItemId);
      
      result.fold(
        (error) => emit(CartError(message: error)),
        (_) => loadCart(),
      );
    }
  }
}
