import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/helper/cache/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);

  static const _key = "isDark";

  Future<void> loadTheme() async {
   var theme=await CacheHelper.sharedPreferences.getBool(_key);
    emit(theme?? false);
  }

  Future<void> toggleTheme(bool value) async {

     await CacheHelper.sharedPreferences.setBool(_key,value);

    emit(value);
  }
}