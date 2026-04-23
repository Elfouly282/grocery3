import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/useCase/addSmartList_UseCase.dart';
import 'SmartListState.dart';

class SmartListCubit extends Cubit<SmartListState> {
  final AddSmartListUseCase useCase;

  SmartListCubit(this.useCase) : super(AddSmartListInitial());

  String name = "";
  String description = "description";


  Timer? _debounce;

  void onNameChanged(String value) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      name = value;
      emit(NameChangedState(value));
    });
  }

  Future<void> createList(List<int> mealIds) async {
    if (name.isEmpty || mealIds.isEmpty) return;

    emit(AddSmartListLoading());

    try {
      await useCase(
        name: name,
        description: description,
        mealIds: mealIds,
      );

      emit(SmartListAddedSuccess());
    } catch (e) {
      emit(AddSmartListError(e.toString()));
    }
  }
  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}