import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:grocery3/features/smart_lists/presentation/screens/empty_widget.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../bloc/smart_lists_bloc.dart';
import '../bloc/smart_lists_event.dart';
import '../bloc/smart_lists_state.dart';
import 'smart_list_details_screen.dart';
import '../../domain/entities/smart_list.dart';
import '../../../product_details/domain/entities/product.dart';
import '../../../product_details/presentation/widgets/product_card.dart';
import '../../../../features/favorites/presentation/bloc/favorites_bloc.dart';
import '../../../../features/favorites/presentation/bloc/favorites_event.dart';
import '../../../../features/favorites/presentation/bloc/favorites_state.dart';
import '../../../../features/orders/presentation/bloc/orders_bloc.dart';
import '../../../../features/orders/presentation/bloc/orders_event.dart';
import '../../../../features/orders/presentation/bloc/orders_state.dart';

class SmartListsScreen extends StatefulWidget {
  const SmartListsScreen({super.key});

  @override
  State<SmartListsScreen> createState() => _SmartListsScreenState();
}

class _SmartListsScreenState extends State<SmartListsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    context.read<SmartListsBloc>().add(GetSmartListsEvent());
    context.read<FavoritesBloc>().add(GetFavoritesEvent());
    context.read<OrdersBloc>().add(GetOrdersEvent());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
    context.read<FavoritesBloc>().add(GetFavoritesEvent());
    context.read<OrdersBloc>().add(GetOrdersEvent());
  }

  @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarBackground,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'My List',
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          dividerColor: Colors.transparent,
          labelColor: AppColors.primary,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppColors.primary,
          indicatorWeight: 3,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          tabs: const [
            Tab(text: 'Smart Lists'),
            Tab(text: 'Favorites'),
            Tab(text: 'History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSmartListsTab(),
          _buildFavoritesTab(),
          _buildHistoryTab(),
        ],
      ),
      floatingActionButton: _buildFab(),
    );
  }

  Widget _buildFab() {
    if (_tabController.index == 0) {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      );
    } else if (_tabController.index == 2) {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFE5E7EB),
        elevation: 2,
        shape: const CircleBorder(),
        child: const Icon(Icons.tune, color: AppColors.primary, size: 24),
      );
    }
    return const SizedBox();
  }

  Widget _buildFavoritesTab() {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        } else if (state is FavoritesError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: AppColors.error),
            ),
          );
        } else if (state is FavoritesLoaded) {
          if (state.favorites.isEmpty) {
            return const EmptyWidget(
              icon: Icon(Icons.favorite_border),
              message: 'You have not added any items to your favorites yet.',
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.favorites.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return _FavoriteHorizontalCard(product: state.favorites[index]);
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildSmartListsTab() {
    return BlocBuilder<SmartListsBloc, SmartListsState>(
      builder: (context, state) {
        if (state is SmartListsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        } else if (state is SmartListsError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: AppColors.error),
            ),
          );
        } else if (state is SmartListsLoaded) {
          if (state.smartLists.isEmpty) {
            return const EmptyWidget(
              icon: Icon(Icons.shopping_basket_outlined),
              message: 'You have not created any smart lists yet.',
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.smartLists.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final list = state.smartLists[index];
              return _buildSmartListCard(context, list);
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildHistoryTab() {
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        if (state is OrdersLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        } else if (state is OrdersError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: AppColors.error),
            ),
          );
        } else if (state is OrdersLoaded) {
          // Extract products from all orders
          final List<ProductEntity> historyProducts = [];
          for (var order in state.orders) {
            for (var item in order.items) {
              historyProducts.add(
                ProductEntity(
                  id: item.id.toString(),
                  title: item.title,
                  description: '',
                  imageUrl: item.imageUrl,
                  price: item.price ?? 0.0,
                  finalPrice: 0.0,
                  hasOffer: false,
                  rating: 5.0,
                  ratingCount: 0,
                  size: '',
                  brand: '',
                  includes: '',
                  howToUse: '',
                  features: '',
                  inStock: true,
                  categoryName: '',
                ),
              );
            }
          }

          if (historyProducts.isEmpty) {
            return const EmptyWidget(
              icon: Icon(Icons.history),
              message: 'Your shopping history is empty. Start shopping now!',
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: historyProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.55,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                product: historyProducts[index],
                onAddToCart: () {},
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildSmartListCard(BuildContext context, SmartListEntity list) {
    String imageUrl =
        list.icon.isNotEmpty
            ? list.icon
            : 'https://images.unsplash.com/photo-1542838132-92c53300491e?q=80&w=200&auto=format&fit=crop';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => Container(color: Colors.grey[100]),
                  errorWidget:
                      (context, url, err) => Container(
                        color: Colors.grey[100],
                        child: const Icon(Icons.image, color: Colors.grey),
                      ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${list.itemsCount} items',
                      style: const TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.delete_outline,
                  color: Color(0xFF9CA3AF),
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Updated 2 days ago',
            style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Add All to Cart',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                height: 48,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SmartListDetailsScreen(listId: list.id);
                        },
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    side: const BorderSide(color: Color(0xFFE5E7EB)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      color: Color(0xFF1F2937),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FavoriteHorizontalCard extends StatelessWidget {
  final ProductEntity product;
  const _FavoriteHorizontalCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white.withOpacity(0.9),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '£${product.finalPrice.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (product.hasOffer)
                      Text(
                        '£${product.price.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF9CA3AF),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 36,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: const Text(
                      'Add to cart',
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
    );
  }
}
