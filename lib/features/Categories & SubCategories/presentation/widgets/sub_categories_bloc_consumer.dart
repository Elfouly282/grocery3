import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/shared_widgets/snackbar_helper.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/entities/sub_categores_item_entity.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/cubit/cubit/sub_category_cubit.dart';

class SubCategoriesBlocConsumer extends StatelessWidget {
  const SubCategoriesBlocConsumer({
    super.key,
    required this.child,
    required this.subCategoriesList,
  });
  final Widget child;
  final ValueChanged<List<SubCategoresItemEntity>> subCategoriesList;
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
          subCategoriesList.call(subCategories);
          return child; // Replace with your actual UI widget
        } else if (state is SubCategoryError) {
          return Center(child: Text(state.message));
        } else
          return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
