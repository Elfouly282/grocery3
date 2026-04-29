import 'package:bloc/bloc.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/entities/categores_entity.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/entities/sub_categores_item_entity.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/repos/sub_categry_repo.dart';
import 'package:meta/meta.dart';

part 'sub_category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.categoryRepo}) : super(CategoryInitial());
  final CategoryRepo categoryRepo;
  Future<void> getCategores() async {
    emit(CategoryLoading());
    var result = await categoryRepo.getCategories();

    result.fold(
      (failure) =>
          emit(CategoryError(failure.errModel?.message ?? 'An error occurred')),
      (categories) => emit(CategoryLoaded(categories)),
    );
  }
}

class SubCategoryCubit extends Cubit<CategoryState> {
  SubCategoryCubit({required this.categoryRepo}) : super(CategoryInitial());
  final CategoryRepo categoryRepo;
  Future<void> getSubCategories(String id) async {
    emit((SubCategoryInitial()));
    var result = await categoryRepo.getSubCategories(id);

    result.fold(
      (failure) => emit(
        SubCategoryError(failure.errModel?.message ?? 'An error occurred'),
      ),
      (categories) => emit(SubCategoryLoaded(categories)),
    );
  }
}
