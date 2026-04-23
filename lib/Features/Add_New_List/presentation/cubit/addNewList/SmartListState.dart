abstract class SmartListState {}

class AddSmartListInitial extends SmartListState {}
class AddSmartListLoading extends SmartListState {}
class NameChangedState extends SmartListState{
  String name;
  NameChangedState(this.name);
}
class SmartListAddedSuccess extends SmartListState {}
class AddSmartListError extends SmartListState {
  final String message;
  AddSmartListError(this.message);
}