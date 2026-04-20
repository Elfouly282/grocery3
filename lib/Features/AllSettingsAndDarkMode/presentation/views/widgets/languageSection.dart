import 'package:flutter/material.dart';
import '../../../../../core/utils/theme/app_styles.dart';
import '../../../../notification/presentation/views/Custom_BackgroundContainer.dart';

class LanguageSection extends StatefulWidget {
  const LanguageSection({Key? key}) : super(key: key);

  @override
  State<LanguageSection> createState() => _LanguageSectionState();
}

class _LanguageSectionState extends State<LanguageSection> {
  String? selectedLanguage = "en";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 9),
          Text("Language", style: AppStyles.font18SemiBold),
          SizedBox(height: 8),
          Text("Preferred Language", style: AppStyles.font14Medium),
          SizedBox(height: 8),

          Align(
            alignment: Alignment.centerLeft,
            child: Custom_BackgroundContainer(
              padding: 10,
              child: DropdownButton<String>(
                value: selectedLanguage,
                underline: SizedBox(), // يشيل الخط
                isDense: true,
                items: const [
                  DropdownMenuItem(

                    value: "en",
                    child: Text("English (US)",style: TextStyle(fontSize: 16,color: Colors.grey),),
                  ),
                  DropdownMenuItem(
                    value: "ar",
                    child: Text("Arabic",style: TextStyle(fontSize: 16,color: Colors.grey),),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}
