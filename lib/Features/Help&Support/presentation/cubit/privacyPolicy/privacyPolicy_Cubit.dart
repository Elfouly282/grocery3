
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/Help&Support/presentation/cubit/privacyPolicy/privacyPolicy_States.dart';

import '../../../domain/repo/help_and_support_repo.dart';

class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  final HelpAndSupportRepo repo;

  PrivacyPolicyCubit(this.repo) : super(PrivacyPolicyInitial());

  Future<void> getPage() async {
    emit(PrivacyPolicyLoading());

    final result = await repo.getPrivacyAndPolicy();

    result.fold(
          (failure) {
        emit(PrivacyPolicyError(failure.errModel.message.toString()));
      },
          (data) {
        emit(PrivacyPolicySuccess(data));
      },
    );
  }
}