import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery3/core/constants/app_assets.dart';
import 'package:grocery3/core/shared_widgets/custom_button.dart';
import 'package:grocery3/core/shared_widgets/custom_text_form_field.dart';
import 'package:grocery3/core/shared_widgets/snackbar_helper.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/auth/presentation/sign_up_view.dart';
import 'package:grocery3/features/home/presentation/screens/home_view.dart';
import 'package:grocery3/features/login/presentation/cubit/login_cubit.dart';
import 'package:grocery3/features/login/presentation/cubit/login_state.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});
  //  static String loginid = 'login_screen';
  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _appBar(context),
            SizedBox(height: 42),
            _loginText(),
            SizedBox(height: 32),
            _inputField(),
            SizedBox(height: 35),
            _loginButton(),
            SizedBox(height: 12),
            _haveAccount(),
          ],
        ),
      ),
    );
  }

  Text _loginText() => Text('Login with email', style: AppStyles.font16Medium);

  Padding _loginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            customSnakebar(context, 'Login Sucessed');
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => HomeView()));
          } else if (state is LoginFailure) {
            customSnakebar(context, state.message);
          } else {
            return;
          }
        },
        builder: (context, state) {
          return state is LoginLoading
              ? CupertinoActivityIndicator()
              : CustomButton(
                text: 'Login',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginCubit>().login(
                      emailController: emailController,
                      passwordController: passwordController,
                    );
                  }
                },
              );
        },
      ),
    );
  }

  Row _haveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don’t have any account? ', style: AppStyles.font12Regular),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpView()),
            );
          },
          child: Text('Sign up', style: AppStyles.font14Regular),
        ),
      ],
    );
  }

  Padding _inputField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomTextFormField(
              controller: emailController,
              // validator: AppValidators.validateEmail,
              prefixIcon: Icon(
                CupertinoIcons.mail,
                color: AppColors.grey,
                size: 20,
              ),
              hintText: 'Email or Phone Number',
            ),
            SizedBox(height: 8),
            CustomTextFormField(
              controller: passwordController,
              // validator: AppValidators.validatePassword,
              suffixIcon: Icon(
                CupertinoIcons.eye_slash_fill,
                color: AppColors.grey,
                size: 20,
              ),
              prefixIcon: Icon(
                CupertinoIcons.lock_fill,
                color: AppColors.grey,
                size: 20,
              ),
              hintText: 'Password',
            ),
            SizedBox(height: 8),
            TextButton(onPressed: () {}, child: Text('Forgot password?')),
          ],
        ),
      ),
    );
  }

  Column _appBar(BuildContext context) {
    return Column(
      // alignment: Alignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.3,
          child: SvgPicture.asset(Assets.assetsSignupBackground),
        ),
        Image.asset(Assets.assetsAuthAppLogo, scale: 4),
        Text('Welcome back !', style: AppStyles.font24Bold),
      ],
    );
  }
}
