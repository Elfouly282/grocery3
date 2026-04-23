
import 'package:flutter/material.dart';

import '../../../domain/entity/productEntity.dart';
import 'ProductItem.dart';
class ProductsGrid extends StatelessWidget {
  final List<ProductEntity> products;

  const ProductsGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            final product = products[index];

            return ProductItem(product: product);
          },
          childCount: products.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.65,
        ),
      ),
    );
  }
}