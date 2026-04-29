import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, required this.icon, required this.message});
  final Widget icon;
 final String message;
  @override
  Widget build(BuildContext context) {
    return Column(children: [ 
      
      icon,
      const SizedBox(height: 8),
      Text(message, style: const TextStyle(color: Colors.grey)),
    ],);
  }
}