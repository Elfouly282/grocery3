abstract class SmartListsEvent {}

class GetSmartListsEvent extends SmartListsEvent {}

class GetSmartListDetailsEvent extends SmartListsEvent {
  final int id;
  GetSmartListDetailsEvent(this.id);
}
