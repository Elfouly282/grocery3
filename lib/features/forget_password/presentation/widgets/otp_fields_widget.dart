import 'package:flutter/material.dart';
import 'otp_single_field_widget.dart';

class OtpFieldsWidget extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;

  const OtpFieldsWidget({
    super.key,
    required this.controllers,
    required this.focusNodes,
  });

  void _onChanged(String value, int index, BuildContext context) {
    if (value.isNotEmpty && index < controllers.length - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center
    ,
      children: List.generate(
        controllers.length,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 16),
          child: OtpSingleFieldWidget(
            controller: controllers[index],
            focusNode: focusNodes[index],
            onChanged: (value) => _onChanged(value, index, context),
          ),
        ),
      ),
    );
  }
}
