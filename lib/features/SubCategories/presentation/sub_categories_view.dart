import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery3/core/constants/app_assets.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/features/SubCategories/presentation/widgets/sub_categories_b_view_body.dart';

class SubCategoriesView extends StatelessWidget {
  const SubCategoriesView({super.key});

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
      body: SubCategoriesBViewBody(),
    );
  }
}
