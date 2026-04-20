
import 'package:flutter/material.dart';
import 'package:grocery3/Features/Help&Support/presentation/views/widgets/HelpAndSupportView_Body.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';

class HelpAndSupportView extends StatelessWidget {
  const HelpAndSupportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(title: "Help & Support"),
      body:HelpandsupportviewBody() ,
    );
  }
}
