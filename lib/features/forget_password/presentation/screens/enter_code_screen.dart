import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/features/forget_password/presentation/bloc/forget_password_bloc.dart';
import 'package:grocery3/features/forget_password/presentation/bloc/forget_password_states.dart';
import 'package:grocery3/features/forget_password/presentation/widgets/otp_body.dart';
import 'reset_password_screen.dart';

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({super.key});

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordStates>(
      listener: (context, state) {
        if (state is SuccessVerifyOtpState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<ForgetPasswordBloc>(),
                child: const ResetPasswordScreen(),
              ),
            ),
          );
        } else if (state is ErrorVerifyOtpState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.error,
            ),
          );
        } else if (state is SuccessForgetPasswordState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Code resent successfully'),
              backgroundColor: AppColors.primary,
            ),
          );
        } else if (state is ErrorForgetPasswordState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.error,
            ),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.background,
            appBar: const CustomAppBar(title: 'Forgot Password', showBackButton: true),
            body: OtpBody(
              controllers: _controllers, 
              focusNodes: _focusNodes,
              isLoading: state is LoadingVerifyOtpState,
            ),
          ),
        );
      },
    );
  }
}
