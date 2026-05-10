import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/features/home/presentation/cubit/home_category_cubit/category_cubit.dart';
import 'package:grocery3/features/home/presentation/cubit/recommended_product_cubit/recommended_product_cubit.dart';
import 'package:grocery3/features/home/presentation/cubit/today_deals_cubit/today_deals_cubit.dart';

import 'package:grocery3/features/home/presentation/widgets/home_view_body.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/cubit/cubit/sub_category_cubit.dart' as sub;
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/repos/sub_categry_repo.dart' as sub_repo;
import 'package:grocery3/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:grocery3/features/favorites/presentation/bloc/favorites_event.dart';
import 'package:grocery3/features/favorites/presentation/bloc/favorites_state.dart';
import 'package:grocery3/injection_container.dart';
import 'package:grocery3/core/shared_widgets/snackbar_helper.dart';

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
          BlocProvider(
            create: (context) => CategoryCubit()..getAllCategories(),
          ),
          BlocProvider(
            create: (context) => sub.SubCategoryCubit(categoryRepo: sl<sub_repo.CategoryRepo>())..getSubCategories('2'),
          ),
        ],
        child: const HomeViewBody(),
      ),
    );
  }
}
