
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/Add_New_List/presentation/cubit/addNewList/SmartListState.dart';

  import '../../../../../core/shared_widgets/custom_button.dart';
  import '../../../../../core/shared_widgets/snackbar_helper.dart';
  import '../../../../../core/utils/theme/app_colors.dart';
  import '../../cubit/addNewList/SmartListCubit.dart';
  import '../../cubit/produts/selection_Cubit.dart';

  class AddListButton extends StatelessWidget {
    const AddListButton({super.key});

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<SmartListCubit, SmartListState>(
          builder: (context, state) {
            final isLoading = state is AddSmartListLoading;

            return CustomButton(
              text: "Add to my list",
              isLoading: isLoading, // ✅ أهم سطر
              onPressed: () {
                final smartList = context.read<SmartListCubit>();

                if (smartList.name.trim().isEmpty) {
                  CustomSnackBar.show(
                    context,
                    isError: true,
                    message: "Add List Name",
                  );
                  return;
                }

                final selectedIds =
                context.read<SelectionCubit>().state.toList();

                if (selectedIds.isEmpty) {
                  CustomSnackBar.show(
                    context,
                    isError: true,
                    message: "Select some products",
                  );
                  return;
                }

                smartList.createList(selectedIds);
              },
              backgroundColor: AppColors.secondary,
            );
          },
        ),
      );
    }
  }
