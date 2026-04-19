import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/features/home/presentation/cubit/home_category_cubit/category_cubit.dart';
import 'package:grocery3/features/home/presentation/cubit/recommended_product_cubit/recommended_product_cubit.dart';
import 'package:grocery3/features/home/presentation/cubit/today_deals_cubit/today_deals_cubit.dart';

import 'package:grocery3/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TodayDealsCubit()..getAllTodayDeals(),
          ),
          BlocProvider(
            create: (context) =>
                RecommendedProductCubit()..getAllRecommendedProducts(),
          ),
          BlocProvider(create: (context)=>CategoryCubit()..getAllCategories())
        ],
        child: HomeViewBody(),
      ),
    );
  }
}
