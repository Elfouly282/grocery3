import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/features/forget_password/presentation/bloc/forget_password_bloc.dart';
import 'package:grocery3/features/forget_password/presentation/bloc/forget_password_states.dart';
import 'package:grocery3/injection_container.dart';
import '../widgets/forgot_password_body.dart';
import 'enter_code_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _isByEmail = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _toggleMethod(bool isEmail) {
    setState(() => _isByEmail = isEmail);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ForgetPasswordBloc>(),
      child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordStates>(
        listener: (context, state) {
          if (state is SuccessForgetPasswordState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<ForgetPasswordBloc>(),
                  child: const EnterCodeScreen(),
                ),
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
              body: ForgotPasswordBody(
                isByEmail: _isByEmail,
                emailController: _emailController,
                phoneController: _phoneController,
                onToggle: _toggleMethod,
                isLoading: state is LoadingForgetPasswordState,
              ),
            ),
          );
        },
      ),
    );
  }
}
