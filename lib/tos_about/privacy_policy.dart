import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Effective Date: April 14, 2025',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20),
              Text(
                'At Astha Tech, your privacy is important to us. This Privacy Policy describes how the Mehendi Designs app collects, uses, and protects your information.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '1. Information Collection',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'We do not collect any personal information directly. However, we use third-party services such as Google AdMob which may collect certain data for analytics and advertising purposes.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '2. Third-Party Services',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'The app uses Google Mobile Ads SDK (AdMob) to serve ads. AdMob may use cookies and other identifiers to personalize ads based on user interests and usage patterns. Please review Google’s privacy policy for more information: https://policies.google.com/privacy',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '3. Data Security',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'We prioritize user data protection and do not store or transmit any personal or sensitive user data. All ad-related data collection is handled by Google\'s secure infrastructure.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '4. Children\'s Privacy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'This app is not intended for children under the age of 13 (or the minimum legal age in your country). We do not knowingly collect personal data from children.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '5. Changes to This Policy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'We may update our Privacy Policy from time to time. Any changes will be reflected in this document with an updated effective date.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '6. Contact Us',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'If you have any questions or concerns regarding this privacy policy, please contact us at: asthatechbd3@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              Text(
                'By using the Mehendi Design Alpona app, you agree to the terms of this Privacy Policy.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
