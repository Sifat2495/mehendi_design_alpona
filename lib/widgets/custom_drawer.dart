import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../screens/favorites_screen.dart';
import '../tos_about/about.dart';
import '../tos_about/privacy_policy.dart';
import '../tos_about/terms_of_service.dart';
import '../utils/rewarded_ad_helper.dart';
import 'contact_us_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isLoading = false;

  void launchRateUs() async {
    final packageName = 'com.example.mehendi_design';
    final Uri url = Uri.parse('https://play.google.com/store/apps/details?id=$packageName');

    try {
      final canLaunch = await canLaunchUrl(url);
      if (canLaunch) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('App is not published yet on the Play Store.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch: $e')),
      );
    }
  }

  void handleFavoritesTap() {
    setState(() {
      isLoading = true;  // Show the loading indicator
    });

    RewardedAdHelper.showRewardedAd(
      context: context,
      onRewardEarned: () {
        setState(() {
          isLoading = false;  // Hide the loading indicator when the ad is shown
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const FavoritesScreen()),
        );
      },
      onAdFailed: () {
        setState(() {
          isLoading = false;  // Hide the loading indicator if the ad fails to load
        });
        // Optionally, you can show a message or do some other action on ad failure
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load the ad. Please try again later.')),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.55, // or use a fixed width like 280
      child: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Mehendi Designs',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('Favorites'),
                onTap: handleFavoritesTap,
              ),
              ListTile(
                leading: const Icon(Icons.description),
                title: const Text('Terms of Service'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TermsOfServiceScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text('Privacy Policy'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Rate Us'),
                onTap: () {
                  launchRateUs();
                },
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
                onTap: () {
                  const String playStoreLink =
                      'https://play.google.com/store/apps/details?id=com.yourcompany.yourapp'; // Replace with your actual Play Store link
                  Share.share('Check out this awesome Mehendi Designs app:\n$playStoreLink');
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_support),
                title: Text('Contact Us'),
                onTap: () => showContactUsDialog(context), // 👈 Show dialog
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AboutPage()),
                  );
                },
              ),
              // Show the loading indicator in the drawer if needed
              if (isLoading)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
