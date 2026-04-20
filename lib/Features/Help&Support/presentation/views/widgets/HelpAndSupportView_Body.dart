import 'package:flutter/material.dart';
import 'package:grocery3/Features/Help&Support/presentation/views/FAQ_view.dart';
import 'package:grocery3/Features/Help&Support/presentation/views/Terms_View.dart';
import 'package:grocery3/Features/Help&Support/presentation/views/about_Us_view.dart';
import 'package:grocery3/Features/Help&Support/presentation/views/contactUsView.dart';
import 'package:grocery3/Features/Help&Support/presentation/views/privacyAndPolicy_View.dart';
import 'package:grocery3/Features/notification/presentation/views/custom_Divider.dart';
import 'package:grocery3/core/utils/theme/app_styles.dart';

class HelpandsupportviewBody extends StatelessWidget {
  const HelpandsupportviewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FaqView()),
              ),
              child: SupportOptionTile(title: '(FAQ)'),
            ),
            Custom_Divider(),
            SizedBox(height: 36),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Contactusview()),
              ),
              child: SupportOptionTile(title: 'Contact Customer Support'),
            ),
            Custom_Divider(),
            SizedBox(height: 36),
            GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsView()),
                ),
                child: SupportOptionTile(title: 'Terms and Conditions')),
            Custom_Divider(),
            SizedBox(height: 36),
            GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyandpolicyView()),
                ),
                child: SupportOptionTile(title: 'Privacy Policy')),
            Custom_Divider(),
            SizedBox(height: 36),
            GestureDetector(
                onTap: () =>  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsView())),
                child: SupportOptionTile(title: 'About Grocery Plus')),
            Custom_Divider(),
            SizedBox(height: 36),
            SupportOptionTile(title: 'App Version: 1.0.5'),
            Custom_Divider(),
          ],
        ),
      ),
    );
  }
}

class SupportOptionTile extends StatelessWidget {
  const SupportOptionTile({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppStyles.font16regular),
        Spacer(),
        Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
