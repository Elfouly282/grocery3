import 'dart:io';

abstract class SmartListState {}

class AddSmartListInitial extends SmartListState {}
class AddSmartListLoading extends SmartListState {}
class NameChangedState extends SmartListState{
  String name;
  NameChangedState(this.name);
}
class ImagePickedState extends SmartListState {
  final File image;
  ImagePickedState(this.image);
}
class SmartListAddedSuccess extends SmartListState {}
class AddSmartListError extends SmartListState {
  final String message;
  AddSmartListError(this.message);
}