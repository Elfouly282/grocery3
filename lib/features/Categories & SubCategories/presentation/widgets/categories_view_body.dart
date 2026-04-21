import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery3/core/constants/app_constants.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/entities/categores_entity.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/entities/sub_categores_item_entity.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/cubit/cubit/sub_category_cubit.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/widgets/categories_section_bloc_consumer.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/widgets/sub_cateories_view_body_bloc_consumer.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/widgets/subCategories_listView_down_item.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/widgets/categories_item.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CategoriesSectionBlocConsumer()),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.kHorizontalPadding,
            ),
            child: SubCategoriesSectionBlocConsumer(),
          ),
        ),
      ],
    );
  }
}
