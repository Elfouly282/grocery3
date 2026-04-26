import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/api/dio_consumer.dart';
import 'package:grocery3/features/product_list/data/data_sources/product_remote_data_source.dart'
    as product_list_data_source;
import 'package:grocery3/features/product_list/data/repositories/product_repository_impl.dart';
import 'package:grocery3/features/product_list/data/repositories/sub_category_repository_impl.dart';
import 'package:grocery3/features/product_list/domain/SubCategories/get_categories_use_case.dart';
import 'package:grocery3/features/product_list/domain/product/get_products_use_case.dart';
import 'package:grocery3/features/product_list/presentation/cubit/product_list_cubit.dart';
import 'package:grocery3/features/product_list/presentation/screen/product_list_screen.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  ProductRepositoryImpl get productRepo =>
      ProductRepositoryImpl(remoteDataSource: subCategoryRemoteDataSource);
  SubCategoryRepositoryImpl get subCategoryRepo =>
      SubCategoryRepositoryImpl(remoteDataSource: subCategoryRemoteDataSource);
  // final dio = Dio();
  final apiConsumer = DioConsumer(dio: Dio());

  product_list_data_source.ProductRemoteDataSource
  get subCategoryRemoteDataSource =>
      product_list_data_source.ProductRemoteDataSourceImpl(apiConsumer);
  // final dynamic productRepo;
  @override
  Widget build(BuildContext context) {
    final getProductsUseCase = GetProductsUseCase(productRepo);
    final getSubCategoriesUseCase = GetSubCategoriesUseCase(subCategoryRepo);
    return BlocProvider(
      create:
          (context) =>
              ProductListCubit(getProductsUseCase, getSubCategoriesUseCase)
                ..getInitialData(),
      child: const ProductListScreen(),
    );
  }
}
