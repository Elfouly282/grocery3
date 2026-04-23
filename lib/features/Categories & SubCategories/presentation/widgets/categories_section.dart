import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery3/core/constants/app_constants.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/entities/categores_entity.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/cubit/cubit/sub_category_cubit.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/widgets/categories_item.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key, required this.categoriesList});

  final List<CategoriesItemEntity> categoriesList;

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  int curruntIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppConstants.kHorizontalPadding),
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
                  itemCount: widget.categoriesList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (curruntIndex != index) {
                          setState(() {
                            curruntIndex = index;
                            context.read<SubCategoryCubit>().getSubCategories(
                                   curruntIndex.toString(),
                                );
                          });
                        }
                      },

                      child: CategroriesItemSwitcher(
                        categoriesItemEntity: widget.categoriesList[index],
                        isActive: curruntIndex == index,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ],
    );
  }
}
