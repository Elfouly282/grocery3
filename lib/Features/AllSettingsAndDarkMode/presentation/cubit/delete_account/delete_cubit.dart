import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/Features/AllSettingsAndDarkMode/presentation/cubit/delete_account/delete_state.dart';
import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/api/api_keys.dart';

class DeleteAccountCubit extends Cubit<DeleteState> {
  DeleteAccountCubit(this.api) : super(DeleteInitial());
  ApiConsumer api;
  Future<void> deleteAccount() async {
    emit(DeleteLoading());

    try {
      final response = await api.delete(EndPoint.delete_account);

      emit(DeleteSuccess());
    } catch (e) {
      emit(DeleteFailure(e.toString()));
    }
  }
}
