import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_button.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/features/forget_password/presentation/widgets/password_reset_sheet_drag_handle.dart';
import 'package:grocery3/features/forget_password/presentation/widgets/password_reset_sheet_message.dart';
import 'package:grocery3/features/forget_password/presentation/widgets/password_reset_sheet_success_icon.dart';
import 'package:grocery3/features/forget_password/presentation/widgets/password_reset_sheet_title.dart';

class PasswordResetSuccessSheet extends StatelessWidget {
  const PasswordResetSuccessSheet({super.key});

  /// Call this to show the bottom sheet
  static void show(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,

      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const PasswordResetSuccessSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 36),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PasswordResetSheetDragHandle(),
          const SizedBox(height: 32),
          const PasswordResetSheetSuccessIcon(),
          const SizedBox(height: 24),
          const PasswordResetSheetTitle(),
          const SizedBox(height: 12),
          const PasswordResetSheetMessage(),
          const SizedBox(height: 32),
          CustomButton(
            text: 'Login',
            onPressed: () {
              Navigator.pop(context);
              //] Navigate to login screen
            },
          ),
        ],
      ),
    );
  }
}
