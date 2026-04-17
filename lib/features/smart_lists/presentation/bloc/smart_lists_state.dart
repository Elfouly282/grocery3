import '../../domain/entities/smart_list.dart';

abstract class SmartListsState {}

class SmartListsInitial extends SmartListsState {}

class SmartListsLoading extends SmartListsState {}

class SmartListsLoaded extends SmartListsState {
  final List<SmartListEntity> smartLists;
  SmartListsLoaded(this.smartLists);
}

class SmartListDetailsLoaded extends SmartListsState {
  final SmartListEntity smartList;
  SmartListDetailsLoaded(this.smartList);
}

class SmartListsError extends SmartListsState {
  final String message;
  SmartListsError(this.message);
}
