import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/shared_widgets/custom_button.dart';
import 'package:grocery3/features/forget_password/presentation/bloc/forget_password_bloc.dart';
import 'package:grocery3/features/forget_password/presentation/bloc/forget_password_event.dart';
import 'package:grocery3/features/forget_password/presentation/screens/enter_code_screen.dart';
import 'package:grocery3/features/forget_password/presentation/widgets/password_reset_bottom_sheet.dart';
import 'package:grocery3/features/forget_password/presentation/widgets/toggle_tab_widget.dart';
import 'subtitle_text_widget.dart';
import 'input_label_widget.dart';
import 'input_field_widget.dart';

class ForgotPasswordBody extends StatelessWidget {
  final bool isByEmail;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final ValueChanged<bool> onToggle;
  final bool isLoading;

  const ForgotPasswordBody({
    super.key,
    required this.isByEmail,
    required this.emailController,
    required this.phoneController,
    required this.onToggle,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ToggleTabWidget(isByEmail: isByEmail, onToggle: onToggle),
          const SizedBox(height: 12),
          SubtitleTextWidget(isByEmail: isByEmail),
          const SizedBox(height: 20),
          InputLabelWidget(isByEmail: isByEmail),
          const SizedBox(height: 8),
          InputFieldWidget(
            isByEmail: isByEmail,
            emailController: emailController,
            phoneController: phoneController,
          ),
          const SizedBox(height: 24),
          CustomButton(
            text: 'Send Code',
            isLoading: isLoading,
            onPressed: () {

              final authMethod = isByEmail
                  ? emailController.text.trim()
                  : phoneController.text.trim();
              if (authMethod.isNotEmpty) {
                context.read<ForgetPasswordBloc>().add(
                  ForgetPasswordEvent(emailOrPhone: authMethod),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
