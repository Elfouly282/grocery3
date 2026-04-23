import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery3/core/constants/app_assets.dart';
import 'package:grocery3/core/constants/app_constants.dart';
import 'package:grocery3/core/shared_widgets/custom_button.dart';
import 'package:grocery3/core/shared_widgets/custom_password_field.dart';
import 'package:grocery3/core/shared_widgets/custom_text_form_field.dart';
import 'package:grocery3/core/shared_widgets/snackbar_helper.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/features/auth/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:grocery3/features/auth/presentation/widgets/confirm_policies_and_terms_widget.dart';
import 'package:grocery3/features/auth/presentation/widgets/you_already_have_account_widget.dart';

import 'upper_signup_view_section.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  String? email, password1, password2, name, phone;
  late bool isAgreedToPolicies = false;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UpperSignUpViewSection(),
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
                    onSaved: (value) {
                      email = value ?? '';
                    },
                    prefixIcon: Image.asset(Assets.assetsEmailIcon, scale: 2),
                    hintText: 'Email or Phone Number',
                  ),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    onSaved: (value) {
                      name = value ?? '';
                    },
                    prefixIcon: Image.asset(Assets.assetsUseIcon, scale: 2),
                    hintText: 'User Name',
                  ),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    onSaved: (value) {
                      phone = value ?? '';
                    },
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: const Color(0xFF878787) /* Color-gray */,
                      size: 20,
                    ),
                    hintText: 'phone number with country code',
                  ),
                  SizedBox(height: 8.h),
                  CustomPasswordField(
                    onSaved: (value) {
                      password1 = value ?? '';
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
                  ),
                  SizedBox(height: 8.h),
                  CustomPasswordField(
                    onSaved: (value) {
                      password2 = value ?? '';
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
                  ),

                  ConfirmPoliciesAndTermsWidget(
                    onChanged: (value) {
                      setState(() {
                        isAgreedToPolicies = value ?? false;
                      });
                    },
                  ),
                  SizedBox(height: 4.h),
                  CustomButton(
                    backgroundColor: AppColors.primary,
                    text: 'Sign Up',
                    onPressed: () {
                      bottomOnPressedMethod(context);
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

  void bottomOnPressedMethod(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save(); // 🔥 لازم دي الأول

      if ((password1 ?? '') != (password2 ?? '')) {
        customSnakebar(context, 'Passwords do not match', isError: true);
        return;
      }

      if (isAgreedToPolicies) {
        context.read<SignUpCubit>().signUp(
          email: email ?? '',
          name: name ?? '',
          phone: phone ?? '',
          password: password2 ?? '',
        );
      } else {
        customSnakebar(
          context,
          'You must agree to the terms and conditions',
          isError: true,
        );
      }
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
