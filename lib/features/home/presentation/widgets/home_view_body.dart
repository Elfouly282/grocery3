import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/constants/app_assets.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/categories_view.dart';
import 'package:grocery3/features/home/domain/entities/recommended_products_entity.dart';
import 'package:grocery3/features/home/domain/entities/today_deal_entity.dart';
import 'package:grocery3/features/home/presentation/cubit/home_category_cubit/category_cubit.dart';
import 'package:grocery3/features/home/presentation/cubit/home_category_cubit/category_state.dart';
import 'package:grocery3/features/home/presentation/cubit/recommended_product_cubit/recommended_product_cubit.dart';
import 'package:grocery3/features/home/presentation/cubit/recommended_product_cubit/recommended_product_state.dart';
import 'package:grocery3/features/home/presentation/cubit/today_deals_cubit/today_deals_cubit.dart';
import 'package:grocery3/features/home/presentation/cubit/today_deals_cubit/today_deals_state.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                _buildSearchBar(),
                const SizedBox(height: 24),
                _buildSectionTitle(context, 'Today\'s Deals'),
                const SizedBox(height: 16),
                _buildPromoBanner(),
                const SizedBox(height: 24),
                _buildSectionTitle(context, 'Categories'),
                const SizedBox(height: 16),
                _buildCategoriesRow(),
                const SizedBox(height: 24),
                _buildSectionTitle(context, 'Recommended For You'),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: _buildRecommendedGrid(),
        ),
      ],
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      floating: true,
      elevation: 0,
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Image.asset(
          Assets.assetsLogo,
          width: 30,
          height: 30,
          fit: BoxFit.contain,
        ),
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.location_on_outlined, size: 18, color: Colors.grey),
            SizedBox(width: 8),
            Text(
              'Reykjavík, Iceland',
              style: TextStyle(fontSize: 13, color: Colors.black87),
            ),
            SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.grey),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black87),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xffEAEEF0),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: AppColors.primary, size: 24),
            Text('Search for any Product', style: AppStyles.font12Regular),
            Spacer(),
            Icon(
              Icons.qr_code_scanner_rounded,
              color: AppColors.primary,
              size: 24,
            ),
            Icon(Icons.mic_none_rounded, color: AppColors.primary, size: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return BlocBuilder<TodayDealsCubit, TodayDealsState>(
      builder: (context, state) {
        if (state is TodayDealsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is TodayDealsSuccess) {
          final deals = state.data;
          return SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: deals.length,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                return _buildPromoCard(deals[index]);
              },
            ),
          );
        }

        if (state is TodayDealsError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox.shrink();
      },
    );
  }

  Container _buildPromoCard(DealEntity banner) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(banner.imageUrl),
          fit: BoxFit.cover,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${banner.discountPrice * 100}% Off',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            banner.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            banner.description,
            style: AppStyles.font12Regular,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoriesView()),
        );
      },
      child: Text(title, style: AppStyles.font24Bold.copyWith(fontSize: 20)),
    );
  }

  Widget _buildCategoriesRow() {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategorySuccess) {
          final categories = state.categories;
          return SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 80,
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade200),
                          image: DecorationImage(
                            image: NetworkImage(categories[index].imageUrl),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        categories[index].name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        if (state is CategoryError) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Center(child: Text(state.message)),
            ),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }

  Widget _buildRecommendedGrid() {
    return BlocBuilder<RecommendedProductCubit, RecommendedProductState>(
      builder: (context, state) {
        if (state is RecommendedProductLoading) {
          return const SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (state is RecommendedProductSuccess) {
          final products = state.data;
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio:
                  0.70, // Adjust to fit card content without overflow
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return _buildProductCard(products[index], context);
            }, childCount: products.length),
          );
        }

        if (state is RecommendedProductError) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Center(child: Text(state.message)),
            ),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }

  Widget _buildProductCard(
    RecommendedProductsEntity product,
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Header
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(product.imageUrl),
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      radius: 14,
                      child: const Icon(
                        Icons.favorite,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Details Footer
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FittedBox(
                      child: Text(
                        product.category.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.font14Regular.copyWith(fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Text(
                        '(${product.category.id}gm)',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    ...List.generate(
                      5,
                      (index) =>
                          const Icon(Icons.star, size: 14, color: Colors.amber),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(${product.category.id})',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '£${product.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: Color(0xFF003B5C),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003B5C),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // TODO: Implement add to cart functionality
                      },
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
