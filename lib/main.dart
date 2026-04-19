import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/api/dio_consumer.dart';

import 'package:grocery3/features/product_list/data/data_sources/product_remote_data_source.dart';

import 'package:grocery3/features/product_list/data/repositories/product_repository_impl.dart';
import 'package:grocery3/features/product_list/data/repositories/sub_category_repository_impl.dart';

import 'package:grocery3/features/product_list/domain/product/get_products_use_case.dart';
import 'package:grocery3/features/product_list/domain/SubCategories/get_categories_use_case.dart';

import 'package:grocery3/features/product_list/presentation/cubit/product_list_cubit.dart';
import 'package:grocery3/features/product_list/presentation/screen/product_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio();
  final apiConsumer = DioConsumer(dio: dio);

  final remoteDataSource = ProductRemoteDataSourceImpl(apiConsumer);
  final productRepo = ProductRepositoryImpl(remoteDataSource: remoteDataSource);
  final subCategoryRepo = SubCategoryRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );

  final getProductsUseCase = GetProductsUseCase(productRepo);
  final getSubCategoriesUseCase = GetSubCategoriesUseCase(subCategoryRepo);

  runApp(
    MyApp(
      getProductsUseCase: getProductsUseCase,
      getSubCategoriesUseCase: getSubCategoriesUseCase,
    ),
  );
}

class MyApp extends StatelessWidget {
  final GetProductsUseCase getProductsUseCase;
  final GetSubCategoriesUseCase getSubCategoriesUseCase;

  const MyApp({
    super.key,
    required this.getProductsUseCase,
    required this.getSubCategoriesUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',
      home: BlocProvider(
        create: (context) =>
            ProductListCubit(getProductsUseCase, getSubCategoriesUseCase)
              ..getInitialData(),
        child: const ProductListScreen(),
      ),
    );
  }
}
