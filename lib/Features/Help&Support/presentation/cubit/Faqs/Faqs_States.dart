import '../../../domain/entity/faqEntity.dart';


abstract class FaqState {}

class FaqInitial extends FaqState {}

class FaqLoading extends FaqState {}

class FaqSuccess extends FaqState {
  final List<FaqEntity> faqs;

  FaqSuccess(this.faqs);
}

class FaqFailure extends FaqState {
  final String message;

  FaqFailure(this.message);
}