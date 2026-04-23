
import 'package:flutter/material.dart';
import 'package:grocery3/Features/Add_New_List/presentation/views/widgets/AddNewList_ViewBody.dart';

import '../../../../core/shared_widgets/custom_app_bar.dart';
import '../../../../main.dart';

class AddnewListView extends StatelessWidget {
  const AddnewListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add a New List"),
      body: AddNewListViewBody(),
    );
  }
}