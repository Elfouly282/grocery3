
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionCubit extends Cubit<Set<int>> {
  SelectionCubit() : super({});

  void toggle(int id) {
    final set = Set<int>.from(state);

    if (set.contains(id)) {
      set.remove(id);
    } else {
      set.add(id);
    }

    emit(set);
  }

  bool isSelected(int id) => state.contains(id);
}