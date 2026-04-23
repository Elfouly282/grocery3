
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/shared_widgets/snackbar_helper.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../cubit/addNewList/SmartListCubit.dart';
import '../../cubit/produts/selection_Cubit.dart';

class AddListButton extends StatelessWidget {
  const AddListButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomButton(
        text: "Add to my list",
        onPressed: () {
          final smartList = context.read<SmartListCubit>();

          if (smartList.name.trim().isEmpty) {
            CustomSnackBar.show(context, message: "Add List Name");
            return;
          }

          final selectedIds =
          context.read<SelectionCubit>().state.toList();

          if (selectedIds.isEmpty) {
            CustomSnackBar.show(context, message: "Select some products");
            return;
          }

          smartList.createList(selectedIds);
        },
        backgroundColor: AppColors.secondary,
      ),
    );
  }
}
