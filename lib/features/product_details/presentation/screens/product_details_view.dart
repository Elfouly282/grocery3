import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/utils/get_it_server_locator.dart';
import 'package:grocery3/features/product_details/presentation/bloc/product_bloc.dart';
import 'package:grocery3/features/product_details/presentation/bloc/product_event.dart';
import 'package:grocery3/features/product_details/presentation/screens/product_details_screen.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productId});
  final int productId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => getIt<ProductBloc>()..add(GetProductDetailsEvent(productId)),

      child: ProductDetailsScreen(productId: productId),
    );
  }
}
