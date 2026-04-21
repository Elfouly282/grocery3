import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery3/core/constants/app_assets.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/utils/get_it_server_locator.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/repos/sub_categry_repo.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/cubit/cubit/sub_category_cubit.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        showBackButton: true,
        actions: [
          Image.asset(Assets.assetsSearchIcon1, scale: 2),
          SizedBox(width: 18.w),
          Image.asset(Assets.assetsCartIcon, scale: 2),
          SizedBox(width: 18.w),
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<CategoryCubit>(
            create:
                (context) =>
                    CategoryCubit(categoryRepo: getIt<CategoryRepo>())
                      ..getCategores(),
          ),
          BlocProvider<SubCategoryCubit>(
            create:
                (context) =>
                    SubCategoryCubit(categoryRepo: getIt<CategoryRepo>())
                      ..getSubCategories('2'),
          ),
        ],
        child: CategoriesViewBody(),
      ),
    );
  }
}
