import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery3/core/constants/app_constants.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/SubCategories/presentation/widgets/subCategories_listView_down_item.dart';
import 'package:grocery3/features/SubCategories/presentation/widgets/sub_categories_item.dart';

class SubCategoriesBViewBody extends StatelessWidget {
  const SubCategoriesBViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: AppConstants.kHorizontalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.h),
                    Text(
                      'Categories',
                      textAlign: TextAlign.start,
                      style: AppStyles.font16Medium,
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 130.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ActiveSubCategoriesItem();
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.kHorizontalPadding,
            ),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return SubcategoriesListviewDownItem();
              },
            ),
          ),
        ),
      ],
    );
  }
}
