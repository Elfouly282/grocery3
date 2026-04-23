import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/Add_New_List/domain/useCase/productUseCase.dart';
import 'package:grocery3/Features/Add_New_List/presentation/cubit/addNewList/SmartListCubit.dart';
import 'package:grocery3/Features/Add_New_List/presentation/views/widgets/AddNewList_ViewBody.dart';
import 'package:grocery3/Features/Add_New_List/presentation/views/widgets/AddToMyListButton.dart';
import 'package:grocery3/core/%20dependency_injection/get_it.dart';
import 'package:grocery3/core/shared_widgets/custom_button.dart';
import 'package:grocery3/core/shared_widgets/snackbar_helper.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';

import '../../../../core/shared_widgets/custom_app_bar.dart';
import '../../../../main.dart';

import '../../domain/useCase/addSmartList_UseCase.dart';
import '../cubit/addNewList/SmartListState.dart';
import '../cubit/produts/productCubit.dart';
import '../cubit/produts/selection_Cubit.dart';

class AddnewListView extends StatelessWidget {
  const AddnewListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          ProductCubit(getIt.get<GetProductsUseCase>())..getProducts(),
        ),
        BlocProvider(
          create: (context) =>
              SmartListCubit(getIt.get<AddSmartListUseCase>()),
        ),
        BlocProvider(
          create: (_) => SelectionCubit(),
        ),
      ],

      child: BlocListener<SmartListCubit, SmartListState>(
        listener: (context, state) {
          if (state is SmartListAddedSuccess) {
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          appBar: CustomAppBar(title: "Add a New List"),
          body: AddNewListViewBody(),
          bottomNavigationBar: Builder(
            builder: (context) {
              return AddListButton();
            },
          ),
        ),
      ),
    );
  }
}

