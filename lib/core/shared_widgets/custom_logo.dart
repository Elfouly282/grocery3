import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  final double? height;
  final double? width;

  const CustomLogo({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png', 
      height: height ?? 120,
      width: width,
      fit: BoxFit.contain,
    );
  }
}