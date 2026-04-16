import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery3/core/constants/app_assets.dart';
import 'package:grocery3/core/shared_widgets/custom_button.dart';
import 'package:grocery3/core/shared_widgets/custom_text_form_field.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }

  Text _loginText() => Text('Login with email', style: AppStyles.font16Medium);

  Padding _loginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomButton(text: 'Login', onPressed: () {}),
    );
  }

  Row _haveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don’t have any account? ', style: AppStyles.font12s400wGrey),
        TextButton(
          onPressed: () {},
          child: Text('Sign up', style: AppStyles.font14s600wPrimary),
        ),
      ],
    );
  }

  Padding _inputField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomTextFormField(
              prefixIcon: Icon(
                CupertinoIcons.mail,
                color: AppColors.grey,
                size: 20,
              ),
              hintText: 'Email or Phone Number',
            ),
            SizedBox(height: 8),
            CustomTextFormField(
              suffixIcon: Icon(
                CupertinoIcons.eye_slash_fill,
                color: AppColors.grey,
                size: 20,
              ),
              isObscureText: true,
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

  Stack _appBar(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppAssets.authAppbar,
          width: double.infinity,
          fit: BoxFit.contain,
          height: MediaQuery.sizeOf(context).height * 0.3,
        ),
        Text('Welcome back !', style: AppStyles.font24s600wWhite),
      ],
    );
  }
}
