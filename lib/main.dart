import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'utils/themes.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'providers/favorites_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize(); // Initialize AdMob
  runApp(const MehendiDesignApp());
}

class MehendiDesignApp extends StatelessWidget {
  const MehendiDesignApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoritesProvider(),
      child: MaterialApp(
        title: 'Mehendi Design App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: HomeScreen(),
      ),
    );
  }
}
