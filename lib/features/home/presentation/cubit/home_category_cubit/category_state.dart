import 'package:grocery3/features/home/domain/entities/category_entity.dart';

class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryEntity> categories;
  CategorySuccess(this.categories);
}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}
