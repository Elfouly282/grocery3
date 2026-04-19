import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YouAlreadyHaveAnAccountWidget extends StatelessWidget {
  const YouAlreadyHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: Text(
            'Already have an account? ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF878787) /* Color-gray */,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 1.h,
            ),
          ),
        ),
        SizedBox(
          width: 63.w,
          child: Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF014162) /* Color-main */,
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
