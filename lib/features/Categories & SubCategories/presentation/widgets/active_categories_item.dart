import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery3/core/shared_widgets/cached_image_widget.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/entities/categores_entity.dart';

class ActiveCategoriesItem extends StatelessWidget {
  const ActiveCategoriesItem({
    super.key,
    required this.categoriesItemEntity,
  });
  final CategoriesItemEntity categoriesItemEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 80,
        height: 117,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.80,
              color: AppColors.grey /* Color-light-gray */,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x7F014162),
              blurRadius: 1,
              offset: Offset(0, 0.50),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 54.h,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                child: CustomNetworkImage(
                  imageUrl: categoriesItemEntity.imageUrl ?? '',
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Flexible(
              child: Text(
                categoriesItemEntity.name ?? 'Meat, Poultry & Seafood',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: AppStyles.font14Medium.copyWith(
                  fontSize: 12,
                  color: AppColors.primary,
                ) /* Color-main */,
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
