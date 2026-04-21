import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/shared_widgets/snackbar_helper.dart';
import 'package:grocery3/core/utils/dummy_data.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/cubit/cubit/sub_category_cubit.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/widgets/categories_view_body.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/widgets/sub_categories_bloc_consumer.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/widgets/sub_categories_section.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SubCategoriesSectionBlocConsumer extends StatelessWidget {
  const SubCategoriesSectionBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubCategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is SubCategoryError) {
          customSnakebar(context, state.message);
        } else if (state is SubCategoryLoaded) {
          //  var subCategories = state.subCategories;
          customSnakebar(context, 'Subcategories loaded successfully');
        }
      },
      builder: (context, state) {
        if (state is SubCategoryLoaded) {
          var subCategories = state.subCategories;
          return SubCategoriesSection(
            subCategoriesList: subCategories,
          ); // Replace with your actual UI widget
        } else if (state is SubCategoryError) {
          return Center(child: Text(state.message));
        } else
          // ignore: curly_braces_in_flow_control_structures
          return Skeletonizer(child: SubCategoriesSection(subCategoriesList: dummySubCategories));
      },
    );
  }
}
