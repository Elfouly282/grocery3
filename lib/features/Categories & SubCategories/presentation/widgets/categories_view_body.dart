import 'package:flutter/material.dart';
import 'package:grocery3/core/constants/app_constants.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/widgets/categories_section_bloc_consumer.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/widgets/sub_cateories_view_body_bloc_consumer.dart';

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
