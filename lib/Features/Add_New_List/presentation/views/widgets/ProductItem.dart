
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/productEntity.dart';
import '../../cubit/produts/selection_Cubit.dart';
import 'ProductCard.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SelectionCubit, Set<int>, bool>(
      selector: (state) => state.contains(product.id),
      builder: (context, isSelected) {
        return GestureDetector(
          onTap: () {
            context.read<SelectionCubit>().toggle(product.id);
          },
          child: ProductCard(
            product: product,
            isSelected: isSelected,
            onAddToCart: () {},
          ),
        );
      },
    );
  }
}