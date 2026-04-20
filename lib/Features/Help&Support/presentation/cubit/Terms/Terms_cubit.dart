import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repo/help_and_support_repo.dart';
import 'Terms_States.dart';

class TermsCubit extends Cubit<TermsState> {
  final HelpAndSupportRepo repo;

  TermsCubit(this.repo) : super(TermsInitial());

  Future<void> getTerms() async {
    emit(TermsLoading());

    final result = await repo.getTerms();

    result.fold(
          (failure) {
        emit(TermsError(failure.errModel.message.toString()));
      },
          (data) {
        emit(TermsSuccess(data));
      },
    );
  }
}