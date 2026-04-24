import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery3/Features/Add_New_List/presentation/views/widgets/CustomListTextField.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/theme/app_colors.dart';
import '../../cubit/addNewList/SmartListCubit.dart';
import '../../cubit/addNewList/SmartListState.dart';
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

            GestureDetector(
              onTap: () {
                context.read<SmartListCubit>().pickImage();
              },
              child: BlocBuilder<SmartListCubit, SmartListState>(
                  builder: (context, state) {
                    final cubit = context.watch<SmartListCubit>();

                    if (cubit.imageFile != null) {
                      return GestureDetector(
                        onTap: () => cubit.pickImage(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            cubit.imageFile!,
                            width: size * 0.2,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }

                    return GestureDetector(
                      onTap: () => cubit.pickImage(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SvgPicture.asset("assets/images/image_outline.svg"),
                      ),
                    );
                  }
              ),
            ),

            const SizedBox(height: 12),

            CustomListTextField(
              hintText: "Name of List",

              filledColor: AppColors.lightGrey,
              prefixIcon: SvgPicture.asset(
                "assets/images/Vector11.svg",
                fit: BoxFit.scaleDown,
              ),
              onchanged: (value) =>
                  context.read<SmartListCubit>().onNameChanged(value),
            ),

            const SizedBox(height: 12),

            CustomTextSearchField(
              suffixIcon: SizedBox(
                width: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      "assets/images/scan.svg",
                      width: 20,
                    ),
                    SvgPicture.asset(
                      "assets/images/mic.svg",
                      width: 20,
                    ),
                  ],
                ),
              ),
              hintText: "Search for any Product",
              prefixIcon: SvgPicture.asset("assets/images/search.svg",fit: BoxFit.scaleDown,),
              onchanged: (q) => context.read<ProductCubit>().search(q),
              filledColor: const Color(0xffEAEEF0),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

}
