
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/Help&Support/domain/repo/help_and_support_repo.dart';

import 'ContactUs_states.dart';

class ContactCubit extends Cubit<ContactState> {
  final HelpAndSupportRepo repo;

  ContactCubit(this.repo) : super(ContactInitial());

  Future<void> sendContact({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    emit(ContactLoading());

    final result = await repo.contactUs(
      name: name,
      email: email,
      subject: subject,
      message: message,
    );

    result.fold(
          (failure) => emit(ContactFailure(failure.errModel.message!)),
          (data) => emit(ContactSuccess(data)),
    );
  }
}