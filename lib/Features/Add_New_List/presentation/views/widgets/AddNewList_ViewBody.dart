import 'package:flutter/material.dart';
import 'package:grocery3/Features/Add_New_List/presentation/views/widgets/CustomSearchTextField.dart';
import 'package:grocery3/Features/Add_New_List/presentation/views/widgets/CustomTextField.dart';
import 'package:grocery3/Features/notification/presentation/views/Custom_BackgroundContainer.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';

import '../../../../../core/shared_widgets/custom_app_bar.dart';
import '../../../../../main.dart';

class AddNewListViewBody extends StatelessWidget {
  const AddNewListViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: AppColors.secondary,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.secondary,
            indicatorWeight: 3,
            tabs: const [
              Tab(text: "Smart Lists"),
              Tab(text: "Favorites"),
              Tab(text: "History"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                SmartestLisView(),
                Center(child: Text("Favorites Content")),
                Center(child: Text("History Content")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SmartestLisView extends StatelessWidget {
  const SmartestLisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                    color: AppColors.lightGrey,
                  ),
                  child: Icon(
                    Icons.image_outlined,
                    size: MediaQuery.of(context).size.width * .15,
                  ),
                ),
                const SizedBox(height: 12),
                CustomTextFormField(
                  hintText: "Name of List",
                  filledColor: AppColors.lightGrey,
                  prefixIcon: Icon(Icons.safety_check_rounded),
                  hintStyle: TextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12),
                CustomTextSearchField(
                  hintText: "Search for any Product",
                  hintStyle: TextStyle(
                    color: AppColors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  filledColor: Color(0xffEAEEF0),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.document_scanner_sharp),
                      SizedBox(width: 8),
                      Icon(Icons.mic),
                    ],
                  ),
                ),
                SizedBox(height: 12,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
