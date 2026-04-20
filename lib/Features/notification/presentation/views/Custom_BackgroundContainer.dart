
import 'package:flutter/material.dart';

class Custom_BackgroundContainer extends StatelessWidget {
  const Custom_BackgroundContainer({
    super.key, required this.child, this.padding,this.color ,this.width
  });
  final Widget child;
  final double? padding;
  final Color? color;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:width  ,
      padding: EdgeInsets.all(padding ?? 8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        color:color?? Colors.white,
      ),
      child:child,
    );
  }
}
