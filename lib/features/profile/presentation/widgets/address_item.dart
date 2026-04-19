import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class AddressItem extends StatelessWidget {
  final String address;

  const AddressItem({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.black)),
        ),
        child: Row(
          children: [
            Container(
              width: 43,
              height: 43,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.profileMenuItemBackground,
              ),
              child: Image.asset("assets/images/map_point_icon.png"),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                address,
                style: AppStyles.font16Medium.copyWith(color: AppColors.black),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
