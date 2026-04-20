import 'package:grocery3/Features/Help&Support/domain/entity/privacy_Policy_Entity.dart';

abstract class PrivacyPolicyState {}

class PrivacyPolicyInitial extends PrivacyPolicyState {}

class PrivacyPolicyLoading extends PrivacyPolicyState {}

class PrivacyPolicySuccess extends PrivacyPolicyState {
  final PrivacyPolicyEntity page;

  PrivacyPolicySuccess(this.page);
}

class PrivacyPolicyError extends PrivacyPolicyState {
  final String message;

  PrivacyPolicyError(this.message);
}