import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/features/home/presentation/cubit/home_category_cubit/category_cubit.dart';
import 'package:grocery3/features/home/presentation/cubit/recommended_product_cubit/recommended_product_cubit.dart';
import 'package:grocery3/features/home/presentation/cubit/today_deals_cubit/today_deals_cubit.dart';
import 'package:grocery3/features/home/presentation/widgets/home_view_body.dart';
import 'package:grocery3/features/layout/presentation/screens/main_screen.dart';
import 'package:grocery3/features/product_list/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:grocery3/features/smart_lists/presentation/screens/smart_list_screen_provide.dart';
import 'package:grocery3/features/smart_lists/presentation/screens/smart_lists_screen.dart';
import 'package:grocery3/features/orders/presentation/screens/orders_screen.dart';
import 'package:grocery3/features/profile/presentation/screens/profile_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _navIndex = 0;

  Widget _buildCurrentPage() {
    switch (_navIndex) {
      case 0:
        return HomeBlocBrovider();
      case 1:
        return SmartListScreenBlocProvide();
      case 2:
        return Placeholder();
      case 3:
        return ProfileScreen();
      default:
        return Placeholder();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCurrentPage(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _navIndex,
        onTap: (index) => setState(() => _navIndex = index),
      ),
    );
  }
}

class HomeBlocBrovider extends StatelessWidget {
  const HomeBlocBrovider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodayDealsCubit()..getAllTodayDeals(),
        ),
        BlocProvider(
          create:
              (context) =>
                  RecommendedProductCubit()..getAllRecommendedProducts(),
        ),
        BlocProvider(create: (context) => CategoryCubit()..getAllCategories()),
      ],
      child: HomeViewBody(),
    );
  }
}
