import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:grocery3/features/product_details/presentation/screens/product_details_view.dart';
import 'package:grocery3/features/product_list/domain/product/product_entity.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsView(productId: product.id),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF4CAF50).withOpacity(0.5),
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.network(
                      product.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white.withOpacity(0.9),
                      child: Icon(
                        product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 18,
                        color: product.isFavorite ? Colors.red : AppColors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: AppStyles.font16SemiBold,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (product.weight != null)
                        Text(
                          " (${product.weight})",
                          style: AppStyles.font12Regular,
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Rating
                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        double rating = product.rating ?? 5.0;
                        return Icon(
                          Icons.star,
                          color:
                              index < rating.floor()
                                  ? AppColors.secondary
                                  : Colors.grey.shade300,
                          size: 14,
                        );
                      }),
                      const SizedBox(width: 4),
                      Text(
                        "(5)",
                        style: AppStyles.font12Regular.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Price Section
                  Row(
                    children: [
                      Text(
                        "£${product.price.toStringAsFixed(0)}",
                        style: AppStyles.font16SemiBold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      if (product.oldPrice != null) ...[
                        const SizedBox(width: 8),
                        Text(
                          "£${product.oldPrice!.toStringAsFixed(0)}",
                          style: AppStyles.font12Regular.copyWith(
                            color: AppColors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Add to cart",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
