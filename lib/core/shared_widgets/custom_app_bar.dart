import 'package:flutter/material.dart';
import 'package:grocery3/Features/notification/presentation/views/custom_Divider.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import '../utils/theme/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
   final bool bottom_divider;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.bottom_divider=false
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
     // backgroundColor: AppColors.primary,
      title: Text(title, style: AppStyles.font16regular),
      centerTitle: true,
      actions: actions,
      automaticallyImplyLeading: showBackButton,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back_ios,),
      ),
      bottom: bottom_divider ? const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child:Custom_Divider()
      ):null ,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}