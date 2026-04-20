import '../../../domain/entity/contact_Us_Entity.dart';

abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactSuccess extends ContactState {
  final ContactEntity contact;

  ContactSuccess(this.contact);
}

class ContactFailure extends ContactState {
  final String message;

  ContactFailure(this.message);
}