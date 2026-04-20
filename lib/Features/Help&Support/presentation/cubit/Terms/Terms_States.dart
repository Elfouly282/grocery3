
import '../../../domain/entity/TermsEntity.dart';

abstract class TermsState {}

class TermsInitial extends TermsState {}

class TermsLoading extends TermsState {}

class TermsSuccess extends TermsState {
  final TermsEntity terms;

  TermsSuccess(this.terms);
}

class TermsError extends TermsState {
  final String message;

  TermsError(this.message);
}