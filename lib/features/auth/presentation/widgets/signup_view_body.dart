import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery3/core/constants/app_assets.dart';
import 'package:grocery3/core/constants/app_constants.dart';
import 'package:grocery3/core/shared_widgets/custom_button.dart';
import 'package:grocery3/core/shared_widgets/custom_text_form_field.dart';
import 'package:grocery3/core/shared_widgets/snackbar_helper.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/auth/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:grocery3/features/auth/presentation/widgets/confirm_policies_and_terms_widget.dart';
import 'package:grocery3/features/auth/presentation/widgets/you_already_have_account_widget.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late String email, password1, password2, name;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image(image: AssetImage(Assets.assetsSignupBackground)),
          SizedBox(height: 46.h),
          Image.asset(Assets.assetsLogo, scale: 4),
          SizedBox(height: 32.h),
          Text('Create your Account', style: AppStyles.font16SemiBold),
          Text(
            'Just a few things to get started',
            style: AppStyles.font16Regular,
          ),
          SizedBox(height: 32.h),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.kHorizontalPadding,
            ),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  CustomTextFormField(
                    onFieldSubmitted: (value) {
                      email = value;
                    },
                    prefixIcon: Image.asset(Assets.assetsEmailIcon, scale: 2),
                    hintText: 'Email or Phone Number',
                  ),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    onFieldSubmitted: (value) {
                      name = value;
                    },
                    prefixIcon: Image.asset(Assets.assetsUseIcon, scale: 2),
                    hintText: 'User Name',
                  ),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    onFieldSubmitted: (value) {
                      password1 = value;
                    },
                    prefixIcon: Image.asset(
                      Assets.assetsPasswordIcon,
                      scale: 2,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: const Color(0xFF878787) /* Color-gray */,
                      size: 16,
                    ),
                    hintText: 'Password',
                    isObscureText: true,
                  ),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    onFieldSubmitted: (value) {
                      password2 = value;
                    },
                    prefixIcon: Image.asset(
                      Assets.assetsPasswordIcon,
                      scale: 2,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: const Color(0xFF878787) /* Color-gray */,
                      size: 16,
                    ),
                    hintText: 'confirm password',
                    isObscureText: true,
                  ),

                  ConfirmPoliciesAndTermsWidget(),
                  SizedBox(height: 43.h),
                  CustomButton(
                    backgroundColor: AppColors.primary,

                    text: 'Sign Up',
                    onPressed: () {
                      if (password1 != password2) {
                        customSnakebar(
                          context,
                          'Passwords do not match',
                          isError: true,
                        );
                      } else {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context.read<SignUpCubit>().signUp(
                            email: email,
                            password: password1,
                            name: name,
                          );
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(height: 12.h),
                  YouAlreadyHaveAnAccountWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
