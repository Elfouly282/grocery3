import '../../domain/Entity/notification_Entity.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationSuccess extends NotificationState {
  final List<NotificationEntity> notifications;
  NotificationSuccess(this.notifications);
}
class NotificationUpdateSuccess extends NotificationState {

}


class NotificationFailure extends NotificationState {
  final String message;
  NotificationFailure(this.message);
}