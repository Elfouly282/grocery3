import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/shared_widgets/snackbar_helper.dart';
import 'package:grocery3/core/utils/dummy_data.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/cubit/cubit/sub_category_cubit.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/widgets/categories_section.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesSectionBlocConsumer extends StatelessWidget {
  const CategoriesSectionBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is CategoryError) {
          customSnakebar(context, state.message , Colors.red);
        } else if (state is CategoryLoaded) {
          customSnakebar(context, 'Categories loaded successfully', Colors.green);
        }
      },
      builder: (context, state) {
        if (state is CategoryLoaded) {
          final categories = state.categories;
          return CategoriesSection(
            categoriesList: categories,
          ); // Replace with your actual UI widget
        } else if (state is CategoryError) {
          return Center(child: Text(state.message));
        } else {
          return Skeletonizer(child: CategoriesSection(categoriesList: dummyCategories));
        }
      },
    );
  }
}
