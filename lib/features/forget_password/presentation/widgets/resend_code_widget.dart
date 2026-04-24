import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/forget_password/presentation/bloc/forget_password_bloc.dart';
import 'package:grocery3/features/forget_password/presentation/bloc/forget_password_event.dart';

class ResendCodeWidget extends StatelessWidget {
  const ResendCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Didn't receive code? ",
          style: AppStyles.font14RegularGrey,
          children: [
            WidgetSpan(
              child: GestureDetector(
                onTap: () {
                  final bloc = context.read<ForgetPasswordBloc>();
                  if (bloc.identifier != null) {
                    bloc.add(ForgetPasswordEvent(emailOrPhone: bloc.identifier!));
                  }
                },
                child: const Text(
                  'Resend code',
                  style: AppStyles.font14Regular,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
