import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import '../utils/theme/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? bgColor;
  final List<Widget>? actions;
  final bool showBackButton;
  final TextStyle? style;
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.style,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: style ?? AppStyles.font24Bold),
      centerTitle: true,
      actions: actions,
      backgroundColor: bgColor ?? AppColors.white,
      automaticallyImplyLeading: showBackButton,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
