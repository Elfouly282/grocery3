import 'package:grocery3/features/home/domain/entities/recommended_products_entity.dart';

class RecommendedProductState {}

class RecommendedProductInitial extends RecommendedProductState {}

class RecommendedProductLoading extends RecommendedProductState {}

class RecommendedProductSuccess extends RecommendedProductState {
  final List<RecommendedProductsEntity> data;

  RecommendedProductSuccess({required this.data});
}

class RecommendedProductError extends RecommendedProductState {
  final String message;

  RecommendedProductError({required this.message});
}