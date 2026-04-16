import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/theme/app_colors.dart'; // تأكد من المسار الصحيح لملف الألوان

class CustomToast {
  
  /// إظهار رسالة سريعة
  static void showToast({
    required String message,
    ToastState state = ToastState.success,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: _chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  /// تحديد لون التوست بناءً على الحالة
  static Color _chooseToastColor(ToastState state) {
    switch (state) {
      case ToastState.success:
        return AppColors.success; // تأكد من تعريف success في AppColors
      case ToastState.error:
        return AppColors.error;   // تأكد من تعريف error في AppColors
      case ToastState.warning:
        return AppColors.warning; // تأكد من تعريف warning في AppColors
    }
  }
}

/// الحالات المختلفة للتوست
enum ToastState { success, error, warning }