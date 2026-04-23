import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmPoliciesAndTermsWidget extends StatefulWidget {
  const ConfirmPoliciesAndTermsWidget({super.key, this.onChanged});
  final void Function(bool?)? onChanged;

  @override
  State<ConfirmPoliciesAndTermsWidget> createState() =>
      _ConfirmPoliciesAndTermsWidgetState();
}

class _ConfirmPoliciesAndTermsWidgetState
    extends State<ConfirmPoliciesAndTermsWidget> {
  bool _isChecked = false;

  void _handleCheckboxChange(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.15.w,
      child: Row(
        children: [
          Checkbox(
            value: _isChecked,
            onChanged: _handleCheckboxChange,
            activeColor: const Color(0xFF014162) /* Color-main */,
            side: BorderSide(
              width: 1.w,
              color: const Color(0xFF878787) /* Color-gray */,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.sp),
            ),
          ),
          SizedBox(
            // width: 195,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'I agree to the ',
                    style: TextStyle(
                      color: const Color(0xFF000015) /* Color-black */,
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.h,
                    ),
                  ),
                  TextSpan(
                    text: 'policies',
                    style: TextStyle(
                      color: const Color(0xFF014162) /* primary */,
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.h,
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(
                      color: const Color(0xFF000015) /* Color-black */,
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.h,
                    ),
                  ),
                  TextSpan(
                    text: 'terms',
                    style: TextStyle(
                      color: const Color(0xFF014162) /* primary */,
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
