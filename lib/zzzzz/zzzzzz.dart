// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:provider/provider.dart';
// import '../providers/favorites_provider.dart';
// import '../screens/design_viewer.dart';
// import '../utils/rewarded_interstitial_ad.dart';
// import '../widgets/mehendi_card.dart';
//
// class CategoryScreen extends StatefulWidget {
//   final String categoryName;
//
//   CategoryScreen({super.key, required this.categoryName});
//
//   @override
//   _CategoryScreenState createState() => _CategoryScreenState();
// }
//
// class _CategoryScreenState extends State<CategoryScreen> {
//   late BannerAd _bannerAd;
//   bool _isBannerAdLoaded = false;
//   int _viewCount = 0;
//
//   final Map<String, List<Map<String, String>>> categoryDesigns = {
//     'Arabic': [
//       {
//         'title': 'Arabic Design 1',
//         'imageUrl':
//         'https://i.postimg.cc/J4nSC43w/IMG-20250409-160913.jpg',
//       },
//       {
//         'title': 'Arabic Design 2',
//         'imageUrl': 'https://i.postimg.cc/fyWpLM69/IMG-20250409-161235.jpg',
//       },
//       {
//         'title': 'Arabic Design 3',
//         'imageUrl': 'https://i.postimg.cc/pr075gH1/IMG-20250409-161437.jpg',
//       },
//       {
//         'title': 'Arabic Design 4',
//         'imageUrl': 'https://i.postimg.cc/dQngfTym/IMG-20250409-161500.jpg',
//       },
//       {
//         'title': 'Arabic Design 5',
//         'imageUrl': 'https://i.postimg.cc/RZJ8qsbX/IMG-20250409-161544.jpg',
//       },
//     ],
//   };
//
//   @override
//   void initState() {
//     super.initState();
//     _loadBannerAd();
//     AdHelper.loadRewardedInterstitialAd();
//   }
//
//   void _loadBannerAd() {
//     _bannerAd = BannerAd(
//       adUnitId: 'ca-app-pub-4606622080198170/1582825773', // Replace with your real ad unit
//       size: AdSize.banner,
//       request: const AdRequest(),
//       listener: BannerAdListener(
//         onAdLoaded: (ad) {
//           setState(() {
//             _isBannerAdLoaded = true;
//           });
//         },
//         onAdFailedToLoad: (ad, error) {
//           ad.dispose();
//           _isBannerAdLoaded = false;
//         },
//       ),
//     );
//     _bannerAd.load();
//   }
//
//   void _handleDesignView(VoidCallback onProceed) {
//     _viewCount++;
//     print('Design view count: $_viewCount');
//
//     if (_viewCount % 5 == 0) {
//       print('View count is a multiple of 5, attempting to show ad...');
//
//       // If the ad is ready, show it immediately
//       if (_isAdReady && _rewardedInterstitialAd != null) {
//         print('✅ Ad is already ready, showing now...');
//         AdHelper.showAdIfReady(() {
//           print('🏆 User earned reward from ad.');
//           onProceed(); // Proceed after the ad
//         });
//       } else {
//         // If the ad is not ready, wait for 2 seconds
//         Future.delayed(Duration(seconds: 2), () {
//           // Check again after 2 seconds
//           if (_isAdReady && _rewardedInterstitialAd != null) {
//             print('✅ Ad is ready after 2 seconds, showing now...');
//             AdHelper.showAdIfReady(() {
//               print('🏆 User earned reward from ad.');
//               onProceed(); // Proceed after the ad
//             });
//           } else {
//             print('⚠️ Ad not ready after 2 seconds, proceeding without ad.');
//             onProceed(); // Proceed without the ad if not ready after 2 seconds
//           }
//         });
//       }
//     } else {
//       print('View count not a multiple of 5, proceeding without ad.');
//       onProceed(); // Proceed without checking for ad if count is not multiple of 5
//     }
//   }
//
//   @override
//   void dispose() {
//     _bannerAd.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final designs = categoryDesigns[widget.categoryName] ?? [];
//     final favoritesProvider = Provider.of<FavoritesProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${widget.categoryName} Designs'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.all(16.0),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1,
//                 crossAxisSpacing: 16.0,
//                 mainAxisSpacing: 16.0,
//                 childAspectRatio: 3 / 2,
//               ),
//               itemCount: designs.length,
//               itemBuilder: (context, index) {
//                 final design = designs[index];
//                 final isFavorite = favoritesProvider.isFavorite(design);
//
//                 return Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     onTap: () {
//                       print('Tapped on: ${design['title']}');
//                       _handleDesignView(() {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DesignViewer(
//                               imageUrl: design['imageUrl']!,
//                               title: design['title']!,
//                             ),
//                           ),
//                         );
//                       });
//                     },
//                     child: MehendiCard(
//                       imageUrl: design['imageUrl']!,
//                       title: design['title']!,
//                       isFavorite: isFavorite,
//                       onFavoriteToggle: () {
//                         if (isFavorite) {
//                           favoritesProvider.removeFromFavorites(design);
//                         } else {
//                           favoritesProvider.addToFavorites(design);
//                         }
//                       },
//                     ),
//                   ),
//                 );
//
//               },
//             ),
//           ),
//           if (_isBannerAdLoaded)
//             SizedBox(
//               height: _bannerAd.size.height.toDouble(),
//               width: _bannerAd.size.width.toDouble(),
//               child: AdWidget(ad: _bannerAd),
//             ),
//         ],
//       ),
//     );
//   }
// }