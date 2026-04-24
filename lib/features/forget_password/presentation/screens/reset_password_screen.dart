import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/shared_widgets/custom_app_bar.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/features/forget_password/presentation/bloc/forget_password_bloc.dart';
import 'package:grocery3/features/forget_password/presentation/bloc/forget_password_states.dart';
import 'package:grocery3/features/forget_password/presentation/bloc/forget_password_event.dart';
import 'package:grocery3/features/forget_password/presentation/widgets/password_reset_bottom_sheet.dart';
import '../widgets/reset_password_body.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscureNew = true;
  bool _obscureConfirm = true;

  bool get _hasMinLength => _newPasswordController.text.length >= 8;
  bool get _hasNumber => _newPasswordController.text.contains(RegExp(r'[0-9]'));
  bool get _passwordsMatch =>
      _newPasswordController.text == _confirmPasswordController.text &&
      _confirmPasswordController.text.isNotEmpty;

  void _toggleObscureNew() => setState(() => _obscureNew = !_obscureNew);
  void _toggleObscureConfirm() =>
      setState(() => _obscureConfirm = !_obscureConfirm);

  void _onPasswordChanged() => setState(() {});

  void _handleReset() {
    if (!_hasMinLength || !_hasNumber) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Password must be at least 8 characters and contain a number.',
          ),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }
    if (!_passwordsMatch) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match.'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }
    
    // Call Bloc to reset password
    context.read<ForgetPasswordBloc>().add(
        ResetPasswordEvent(
            newPassword: _newPasswordController.text, 
            confirmPassword: _confirmPasswordController.text,
        ),
    );
  }

  @override
  void initState() {
    super.initState();
    _newPasswordController.addListener(_onPasswordChanged);
    _confirmPasswordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordStates>(
      listener: (context, state) {
        if (state is SuccessResetPasswordState) {
           PasswordResetSuccessSheet.show(context);
        } else if (state is ErrorResetPasswordState) {
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
            appBar: const CustomAppBar(title: 'Reset Password', showBackButton: true),
            body: ResetPasswordBody(
              newPasswordController: _newPasswordController,
              confirmPasswordController: _confirmPasswordController,
              obscureNew: _obscureNew,
              obscureConfirm: _obscureConfirm,
              hasMinLength: _hasMinLength,
              hasNumber: _hasNumber,
              passwordsMatch: _passwordsMatch,
              onToggleNew: _toggleObscureNew,
              onToggleConfirm: _toggleObscureConfirm,
              isLoading: state is LoadingResetPasswordState,
              onReset: _handleReset,
            ),
          ),
        );
      },
    );
  }
}
