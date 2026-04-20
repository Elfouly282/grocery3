
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/Help&Support/domain/repo/help_and_support_repo.dart';

import 'Faqs_States.dart';


class FaqCubit extends Cubit<FaqState> {
  final HelpAndSupportRepo repo;

  FaqCubit(this.repo) : super(FaqInitial());

  Future<void> getFaqs() async {
    emit(FaqLoading());

    final result = await repo.getFaqs();

    result.fold(
          (failure) => emit(FaqFailure(failure.errModel.message!)),
          (data) => emit(FaqSuccess(data)),
    );
  }
}