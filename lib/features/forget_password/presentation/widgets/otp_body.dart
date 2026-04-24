import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/shared_widgets/custom_button.dart';
import 'package:grocery3/features/forget_password/presentation/bloc/forget_password_bloc.dart';
import 'package:grocery3/features/forget_password/presentation/bloc/forget_password_event.dart';
import 'otp_header_widget.dart';
import 'otp_fields_widget.dart';
import 'resend_code_widget.dart';

class OtpBody extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final bool isLoading;

  const OtpBody({
    super.key,
    required this.controllers,
    required this.focusNodes,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OtpHeaderWidget(),
          const SizedBox(height: 32),
          OtpFieldsWidget(controllers: controllers, focusNodes: focusNodes),
          const SizedBox(height: 32),
          CustomButton(
            text: 'Verify',
            isLoading: isLoading,
            onPressed: () {
              final otp = controllers.map((c) => c.text).join();
              if (otp.length == 4) {
                 context.read<ForgetPasswordBloc>().add(VerifyOtpEvent(otp: otp));
              }
            },
          ),
          const SizedBox(height: 16),
          const ResendCodeWidget(),
        ],
      ),
    );
  }
}
