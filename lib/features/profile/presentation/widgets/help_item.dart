import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_divider.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class HelpItem extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const HelpItem({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: AppStyles.font16Medium.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
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
        ),
        CustomDivider(thickness: 1),
      ],
    );
  }
}
