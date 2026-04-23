
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/Add_New_List/presentation/views/widgets/CustomListTextField.dart';


import '../../../../../core/utils/theme/app_colors.dart';
import '../../cubit/addNewList/SmartListCubit.dart';
import '../../cubit/produts/productCubit.dart';
import 'CustomSearchTextField.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child:  Icon(Icons.image_outlined,size: size*0.17,),
            ),

            const SizedBox(height: 12),

            CustomListTextField(
              hintText: "Name of List",

              filledColor: AppColors.lightGrey,
              prefixIcon: const Icon(Icons.safety_check_rounded),
              onchanged: (value) =>
                  context.read<SmartListCubit>().onNameChanged(value),
            ),

            const SizedBox(height: 12),

            CustomTextSearchField(
              hintText: "Search for any Product",
              prefixIcon: const Icon(Icons.search),
              onchanged: (q) =>
                  context.read<ProductCubit>().search(q),
              filledColor: const Color(0xffEAEEF0),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
