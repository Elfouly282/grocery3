import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/product_list/presentation/cubit/product_list_cubit.dart';
import 'package:grocery3/features/product_list/presentation/cubit/product_list_state.dart';
import 'package:grocery3/features/product_list/presentation/widgets/category_item.dart';
import 'package:grocery3/features/product_list/presentation/widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    // شيلنا الـ BlocProvider من هنا لأننا بنوفره في ملف الـ main.dart
    // الـ BlocBuilder هيدور على الـ Cubit اللي جاي من فوقه في الـ Widget Tree
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: BlocBuilder<ProductListCubit, ProductListState>(
        builder: (context, state) {
          if (state is ProductListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductListSuccess) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _buildSubCategoriesSection(context, state),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text("Products", style: AppStyles.font18SemdiBold),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.62,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return ProductCard(product: state.products[index]);
                    }, childCount: state.products.length),
                  ),
                ),
              ],
            );
          } else if (state is ProductListError) {
            return Center(
              child: Text(
                state.message,
                style: AppStyles.font16Medium.copyWith(color: AppColors.error),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.black,
          size: 20,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: AppColors.black, size: 28),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: AppColors.black,
            size: 28,
          ),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildSubCategoriesSection(
    BuildContext context,
    ProductListSuccess state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text("Sub Categories", style: AppStyles.font18SemdiBold),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              final category = state.categories[index];
              final isSelected = state.selectedCategoryId == category.id;
              return CategoryItem(
                category: category,
                isSelected: isSelected,
                onTap: () {
                  // بننادي على الـ Cubit الموجود في الـ context
                  context.read<ProductListCubit>().getProductsByCategory(
                    isSelected ? null : category.id,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
