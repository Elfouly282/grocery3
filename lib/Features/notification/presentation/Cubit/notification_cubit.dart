import 'package:bloc/bloc.dart';
import 'package:grocery3/Features/notification/domain/repo/NotificationRepo.dart';
import 'package:meta/meta.dart';

import '../../domain/Entity/notification_Entity.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepo repo;

  NotificationCubit(this.repo) : super(NotificationInitial());

  Future<void> getSettings() async {
    emit(NotificationLoading());

    final data = await repo.getSettings();
    data.fold(
      (failre) {
        emit(NotificationFailure(failre.errModel.message!));
        print("🔥 failure API");
        print(failre.errModel.message);
      },
      (notifications) {
        emit(NotificationSuccess(notifications));
        print("🔥 calling API");
      },
    );
  }



  Future<void> updateSetting({
    required String groupKey,
    required String settingKey,
    required bool value,
  }) async {
    final currentState = state;

    if (currentState is NotificationSuccess) {
      // 🔥 optimistic update (تغيير فوري في UI)
      final updatedList = currentState.notifications.map((e) {
        if (e.key == groupKey) {
          final updatedSettings = Map<String, bool>.from(e.settings);
          updatedSettings[settingKey] = value;

          return NotificationEntity(
            key: e.key,
            title: e.title,
            enabled: e.enabled,
            settings: updatedSettings,
          );
        }
        return e;
      }).toList();

      emit(NotificationSuccess(updatedList));

      // 🔁 API CALL
      final result = await repo.updateSettings(
        groupKey: groupKey,
        settingKey: settingKey,
        value: value,
      );

      result.fold(
            (failure) {
          print(failure.errModel.message);
          print("------------------------------------------------------------------------");
          emit(currentState);
        },
            (updatedList) {


        },
      );
    }
  }
}
