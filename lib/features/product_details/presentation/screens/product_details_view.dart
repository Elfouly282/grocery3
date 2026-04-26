import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/api/dio_consumer.dart';
import 'package:grocery3/features/product_details/data/datasources/product_remote_data_source.dart';
import 'package:grocery3/features/product_details/domain/usecases/get_product_details.dart';
import 'package:grocery3/features/product_details/presentation/bloc/product_bloc.dart';
import 'package:grocery3/features/product_details/presentation/bloc/product_event.dart';
import 'package:grocery3/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:grocery3/features/product_details/data/repositories/product_repository_impl.dart';
import 'package:grocery3/injection_container.dart' as di;

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // final productRepo = ProductRepositoryImpl(
    //   remoteDataSource: ProductRemoteDataSourceImpl(
    //     api: DioConsumer(dio: Dio()),
    //   ),
    // );
    return BlocProvider(
      create: (context) => di.sl<ProductBloc>(),

      child: const ProductDetailsScreen(productId: '1'),
    );
  }
}
