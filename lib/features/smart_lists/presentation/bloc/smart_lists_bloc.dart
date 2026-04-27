import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/features/smart_lists/domain/usecases/get_smart_list_details.dart';
import 'package:grocery3/features/smart_lists/domain/usecases/get_smart_lists.dart';
import 'package:grocery3/features/smart_lists/presentation/bloc/smart_lists_event.dart';
import 'package:grocery3/features/smart_lists/presentation/bloc/smart_lists_state.dart';
import 'package:grocery3/core/error/failures.dart';

class SmartListsBloc extends Bloc<SmartListsEvent, SmartListsState> {
  final GetSmartListsUseCase getSmartListsUseCase;
  final GetSmartListDetailsUseCase getSmartListDetailsUseCase;

  SmartListsBloc({
    required this.getSmartListsUseCase,
    required this.getSmartListDetailsUseCase,
  }) : super(SmartListsInitial()) {
    on<GetSmartListsEvent>((event, emit) async {
      emit(SmartListsLoading());
      final result = await getSmartListsUseCase();
      result.fold(
        (failure) => emit(SmartListsError(failure.message)),
        (lists) => emit(SmartListsLoaded(lists)),
      );
    });

    on<GetSmartListDetailsEvent>((event, emit) async {
      emit(SmartListsLoading());
      final result = await getSmartListDetailsUseCase(event.id);
      result.fold(
        (failure) => emit(SmartListsError(failure.message)),
        (list) => emit(SmartListDetailsLoaded(list)),
      );
    });
  }
}
