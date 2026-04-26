
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';
import '../widgets/info_card.dart';
import '../widgets/product_card.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../features/favorites/presentation/bloc/favorites_bloc.dart';
import '../../../../features/favorites/presentation/bloc/favorites_event.dart';
import '../../../../features/favorites/presentation/bloc/favorites_state.dart';

@RoutePage()

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  bool? _isFavorited;

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetProductDetailsEvent(widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary, size: 20),
          onPressed: () {
            if (context.router.canPop()) {
              context.router.pop();
            } else {
              context.router.replace(const ProductListRoute());
            }
          },
        ),
        title: const Text(
          'Product Details',
          style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.primary, size: 22),
            onPressed: () {
              // Action for search
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: AppColors.primary, size: 22),
            onPressed: () => context.router.push(const CartRoute()),
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primary));
          } else if (state is ProductError) {
            return Center(child: Text(state.message, style: const TextStyle(color: AppColors.error)));
          } else if (state is ProductLoaded) {
            final product = state.product;
            _isFavorited ??= product.isFavorite;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image with Favorite Icon (Full Width)
                  Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: product.imageUrl,
                        height: 250, // Increased height for full-width presentation
                        width: double.infinity,
                        fit: BoxFit.cover, // Fit to cover the entire width
                        placeholder: (context, url) => Container(color: AppColors.lightGrey),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isFavorited = !(_isFavorited ?? false);
                            });
                            context.read<FavoritesBloc>().add(ToggleFavoriteEvent(product.id));
                          },
                          child: CircleAvatar(
                            backgroundColor: AppColors.white,
                            child: Icon(
                              (_isFavorited ?? false) ? Icons.favorite : Icons.favorite_border,
                              color: (_isFavorited ?? false) ? Colors.red : AppColors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Rest of the content wrapped in padding
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title and Price
                        Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 18, // Reduced from 22
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '£${product.finalPrice.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 18, // Reduced from 20
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondary,
                            ),
                          ),
                          if (product.hasOffer)
                            Text(
                              '£${product.price.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 13, // Reduced from 14
                                color: AppColors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Rating
                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        return Icon(
                          index < product.rating.floor() ? Icons.star : Icons.star_border,
                          color: AppColors.accent,
                          size: 20,
                        );
                      }),
                      const SizedBox(width: 8),
                      Text(
                        '(${product.ratingCount})',
                        style: const TextStyle(color: AppColors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Details Section
                  const Text(
                    'Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: InfoCard(title: 'Includes', value: product.includes)),
                      const SizedBox(width: 10),
                      Expanded(child: InfoCard(title: 'Size', value: product.size)),
                      const SizedBox(width: 10),
                      Expanded(child: InfoCard(title: 'Expiry', value: '6 months')), // Hardcoded as placeholder if not in entity
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: const TextStyle(color: AppColors.grey, height: 1.4, fontSize: 13),
                  ),
                  const SizedBox(height: 20),
                  // How to Use
                  const Text(
                    'How to Use',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.howToUse,
                    style: const TextStyle(color: AppColors.grey, height: 1.4, fontSize: 13),
                  ),
                  const SizedBox(height: 20),
                  // Similar Products
                  if (product.similarProducts.isNotEmpty) ...[
                    const Text(
                      'Similar Products',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 220, // Reduced from 280

                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: product.similarProducts.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product: product.similarProducts[index],
                            onAddToCart: () {},
                          );
                        },
                      ),
                    ),
                  ],
                  const SizedBox(height: 100), // Spacing for bottom bar
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            // Quantity Selector
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.secondary),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, color: AppColors.secondary),
                    onPressed: () {
                      if (quantity > 1) setState(() => quantity--);
                    },
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: AppColors.secondary),
                    onPressed: () => setState(() => quantity++),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Add to Cart Button
            Expanded(
              child: ElevatedButton(
                onPressed: () => context.router.push(const CartRoute()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Add to cart',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
