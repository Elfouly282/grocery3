import 'package:flutter/material.dart';
import 'package:grocery3/core/shared_widgets/custom_divider.dart';
import 'package:grocery3/core/utils/theme/app_colors.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';
import 'package:grocery3/features/profile/presentation/screens/settings_screen.dart';
import 'package:grocery3/features/profile/presentation/widgets/section_title.dart';

class LanguageSection extends StatefulWidget {
  const LanguageSection({super.key});

  @override
  State<LanguageSection> createState() => _LanguageSectionState();
}

class _LanguageSectionState extends State<LanguageSection> {
  String _selected = 'English (US)';

  final List<String> _languages = [
    'English (US)',
    'Arabic',
    'French',
    'Spanish',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Language'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Preferred Language',
            style: AppStyles.font14Regular.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.dividerColor),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selected,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.grey,
                ),
                style: AppStyles.font16Medium.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
                onChanged: (value) => setState(() => _selected = value!),
                items: _languages
                    .map(
                      (lang) =>
                          DropdownMenuItem(value: lang, child: Text(lang)),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        CustomDivider(thickness: 1.5),
      ],
    );
  }
}
