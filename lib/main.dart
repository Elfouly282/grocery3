import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery3/features/auth/presentation/sign_up_view.dart';

void main() {
  runApp(const Grocery3());
}

class Grocery3 extends StatelessWidget {
  const Grocery3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp ( 
      
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        designSize: Size(402, 874), 
      minTextAdapt: true,
      splitScreenMode: true,
        child: SignUpView()),
    );
  }
}