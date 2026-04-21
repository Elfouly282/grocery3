part of 'sub_category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoriesItemEntity> categories;
  CategoryLoaded(this.categories);
}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}

/////////////////////////////////////////////////////// Sub Categories states
final class SubCategoryInitial extends CategoryState {}

final class SubCategoryLoading extends CategoryState {}

class SubCategoryLoaded extends CategoryState {
  final List<SubCategoresItemEntity> subCategories;
  SubCategoryLoaded(this.subCategories);
}

class SubCategoryError extends CategoryState {
  final String message;
  SubCategoryError(this.message);
}
