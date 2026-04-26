// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:grocery3/features/product_list/domain/SubCategories/sub_category_repo.dart';
import 'package:grocery3/features/product_list/domain/SubCategories/get_categories_use_case.dart';
import 'package:grocery3/features/product_list/domain/SubCategories/sub_category_entity.dart';
import 'package:grocery3/features/product_list/domain/product/get_products_use_case.dart';
import 'package:grocery3/features/product_list/domain/product/product_repository.dart';
import 'package:grocery3/features/product_list/data/models/product_model.dart';
import 'package:grocery3/main.dart';

class FakeProductRepo implements BaseProductRepo {
  @override
  Future<List<ProductModel>> getProducts() async => [];
}

class FakeSubCategoryRepo implements BaseSubCategoryRepo {
  @override
  Future<List<SubCategoryEntity>> getSubCategory() async => [];
}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final getProductsUseCase = GetProductsUseCase(FakeProductRepo());
    final getSubCategoriesUseCase = GetSubCategoriesUseCase(FakeSubCategoryRepo());

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      getProductsUseCase: getProductsUseCase,
      getSubCategoriesUseCase: getSubCategoriesUseCase,
    ));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
