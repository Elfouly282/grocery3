import 'package:flutter/material.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/entities/sub_categores_item_entity.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/widgets/subCategories_listView_down_item.dart';

class SubCategoriesSection extends StatelessWidget {
  const SubCategoriesSection({
    super.key, required this.subCategoriesList,
   
  });

  final List<SubCategoresItemEntity> subCategoriesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: subCategoriesList.length,
      itemBuilder: (context, index) {
        return SubcategoriesListviewDownItem(
          subCategoriesItem: subCategoriesList[index],
        );
      },
    );
  }
}

