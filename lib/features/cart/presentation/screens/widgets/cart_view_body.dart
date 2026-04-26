// presentation/widgets/cart_view_body.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/shared_widgets/custom_button.dart';
import 'package:grocery3/core/shared_widgets/snackbar_helper.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:grocery3/features/cart/presentation/cubit/cart_state.dart';
import 'package:grocery3/features/cart/presentation/screens/widgets/cart_item_widget.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartError) {
          customSnakebar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }

        if (state is CartError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: AppColors.grey),
                const SizedBox(height: 16),
                Text(
                  state.message,
                  style: AppStyles.font16Medium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    context.read<CartCubit>().loadCart();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        final cart =
            state is CartLoaded
                ? (state as CartLoaded).cart
                : state is CartItemUpdating
                ? (state as CartItemUpdating).cart
                : state is CartItemRemoving
                ? (state as CartItemRemoving).cart
                : null;

        if (cart == null || cart.items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 64,
                  color: AppColors.grey,
                ),
                const SizedBox(height: 16),
                Text('Your cart is empty', style: AppStyles.font16Medium),
                const SizedBox(height: 8),
                Text(
                  'Add items to get started',
                  style: AppStyles.font14Regular.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          );
        }

        final updatingItemId =
            state is CartItemUpdating
                ? (state as CartItemUpdating).updatingItemId
                : null;
        final removingItemId =
            state is CartItemRemoving
                ? (state as CartItemRemoving).removingItemId
                : null;

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];  //TODO :  take this list 
                  final isUpdating = updatingItemId == item.id;
                  final isRemoving = removingItemId == item.id;

                  return Opacity(
                    opacity: isRemoving ? 0.5 : 1.0,
                    child: CartItemWidget(
                      item: item,
                      isUpdating: isUpdating,
                      onIncrement: () {
                        // context.read<CartCubit>().incrementQuantity(
                        //       item.id,
                        //       item.quantity,
                        //     );
                      },
                      onDecrement: () {
                        // context.read<CartCubit>().decrementQuantity(
                        //       item.id,
                        //       item.quantity,
                        //     );
                      },
                      onRemove: () {
                        // context.read<CartCubit>().removeItem(item.id);
                      },
                    ),
                  );
                },
              ),
            ),

            // More to Explore Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('More To Explore', style: AppStyles.font16Medium),
              ),
            ),
            const SizedBox(height: 16),

            // Total and Checkout
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: AppStyles.font24Bold),
                        Text(
                          '£${cart.total.toStringAsFixed(0)}',
                          style: AppStyles.font24Bold,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: 'Continue To Checkout',
                      onPressed: () {
                        //TODO navigate with  list
                        customSnakebar(context, 'Proceeding to checkout...');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
