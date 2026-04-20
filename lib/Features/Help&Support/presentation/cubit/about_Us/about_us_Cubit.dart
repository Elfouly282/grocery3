import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/Help&Support/presentation/cubit/privacyPolicy/privacyPolicy_States.dart';

import '../../../domain/repo/help_and_support_repo.dart';
import 'about_us_States.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  final HelpAndSupportRepo repo;

  AboutUsCubit(this.repo) : super(AboutUsInitial());

  Future<void> aboutUs() async {
    emit(AboutUsLoading());

    final result = await repo.aboutUs();

    result.fold(
          (failure) {
        emit(AboutUsError(failure.errModel.message.toString()));
      },
          (data) {
        emit(AboutUsSuccess(data));
      },
    );
  }
}