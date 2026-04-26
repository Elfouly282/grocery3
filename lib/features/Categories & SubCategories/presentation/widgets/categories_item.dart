import 'package:flutter/material.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/entities/categores_entity.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/widgets/active_categories_item.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/presentation/widgets/in_active_categories_item.dart';

class CategroriesItemSwitcher extends StatelessWidget {
  const CategroriesItemSwitcher({
    super.key,
    required this.isActive,
    required this.categoriesItemEntity,
  });
  final CategoriesItemEntity categoriesItemEntity;

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 500),
      firstChild: ActiveCategoriesItem(
        categoriesItemEntity: categoriesItemEntity,
      ),
      secondChild: InActiveCategoriesItem(
        categoriesItemEntity: categoriesItemEntity,
      ),
      crossFadeState:
          isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}


