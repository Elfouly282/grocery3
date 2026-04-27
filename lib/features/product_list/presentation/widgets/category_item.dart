import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/cached_image_widget.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/product_list/domin/sub_categoriy_entity.dart';

class CategoryItem extends StatelessWidget {
  final SubCategoryEntity category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF4CAF50) : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CustomNetworkImage(imageUrl: category.imageUrl ?? ' '),
              ),
            ),

            const SizedBox(height: 8),
            Text(
              category.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.font14Medium.copyWith(
                color: isSelected ? AppColors.primary : AppColors.black,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
