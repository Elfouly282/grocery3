// presentation/cubit/cart_state.dart

import 'package:grocery3/features/cart/domain/entitis/cart_item_entity.dart';

class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final Cart cart;
  
  CartLoaded(this.cart);
}

class CartError extends CartState {
  final String message;
  
  CartError({required this.message});
}

class CartItemUpdating extends CartState {
  final Cart cart;
  final int updatingItemId;
  
  CartItemUpdating({
    required this.cart,
    required this.updatingItemId,
  });
}

class CartItemRemoving extends CartState {
  final Cart cart;
  final int removingItemId;
  
  CartItemRemoving({
    required this.cart,
    required this.removingItemId,
  });
}
