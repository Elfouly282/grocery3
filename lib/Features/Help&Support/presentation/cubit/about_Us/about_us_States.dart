
import '../../../domain/entity/privacy_Policy_Entity.dart';

abstract class AboutUsState {}

class AboutUsInitial extends AboutUsState {}

class AboutUsLoading extends AboutUsState {}

class AboutUsSuccess extends AboutUsState {
  final PrivacyPolicyEntity page;

  AboutUsSuccess(this.page);
}

class AboutUsError extends AboutUsState {
  final String message;

  AboutUsError(this.message);
}