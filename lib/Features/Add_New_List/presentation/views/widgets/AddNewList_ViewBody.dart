import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grocery3/Features/Add_New_List/presentation/views/widgets/productGrid.dart';

import '../../cubit/produts/productCubit.dart';
import '../../cubit/produts/product_state.dart';

import 'header_section.dart';

class AddNewListViewBody extends StatelessWidget {
  const AddNewListViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductError) {
          return Center(child: Text(state.message));
        }

        if (state is ProductLoaded) {
          return CustomScrollView(
            slivers: [
              HeaderSection(),
              ProductsGrid(products: state.products),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
