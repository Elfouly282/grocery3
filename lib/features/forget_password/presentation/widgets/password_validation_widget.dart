import 'package:flutter/material.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class PasswordValidationWidget extends StatelessWidget {
  final bool hasMinLength;
  final bool hasNumber;

  const PasswordValidationWidget({
    super.key,
    required this.hasMinLength,
    required this.hasNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ValidationRowWidget(
          label: 'Must be at least 8 characters',
          isValid: hasMinLength,
        ),
        const SizedBox(height: 8),
        _ValidationRowWidget(label: 'Contains a number', isValid: hasNumber),
      ],
    );
  }
}

class _ValidationRowWidget extends StatelessWidget {
  final String label;
  final bool isValid;

  const _ValidationRowWidget({required this.label, required this.isValid});

  @override
  Widget build(BuildContext context) {
    print("isValid $isValid");
    return Row(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Icon(
            isValid ? Icons.check_circle_outline : Icons.radio_button_unchecked,
            key: ValueKey(isValid),
            color: isValid ? AppColors.primary : AppColors.grey,
            size: 18,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: isValid
              ? AppStyles.font13RegularDeepBlue
              : AppStyles.font13RegularGrey400,
        ),
      ],
    );
  }
}
