import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utils/colors.dart';
import '../widgets/category_card.dart';
import '../screens/category_screen.dart';
import '../screens/design_viewer.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late BannerAd _topBannerAd;
  late BannerAd _gridBannerAd;
  late BannerAd _botBannerAd;
  bool _isTopAdLoaded = false;
  bool _isbotAdLoaded = false;

  final List<Map<String, String>> categories = [
    {
      'name': 'Arabic',
      'imageUrl':
          'https://i.postimg.cc/pr075gH1/IMG-20250409-161437.jpg',
    },
    {
      'name': 'Artistic',
      'imageUrl':
          'https://i.postimg.cc/vH4MLvN6/IMG-20250409-160712.jpg',
    },
    {
      'name': 'Back Hand',
      'imageUrl':
          'https://i.postimg.cc/xTbMGkJ5/d51219b828c2f52c57ef6bec5753bc3f.jpg',
    },
    {
      'name': 'Bridal',
      'imageUrl':
          'https://i.postimg.cc/zvRH8rHW/11.jpg',
    },
    {
      'name': 'Butterfly Themed',
      'imageUrl':
          'https://i.postimg.cc/HLcGjj5M/b-fly-6.jpg',
    },
    {
      'name': 'Creative',
      'imageUrl':
          'https://i.postimg.cc/Tw5qJFg4/Creative-3.jpg',
    },
    {
      'name': 'Eid',
      'imageUrl':
          'https://i.postimg.cc/LsWwjRR1/Eid-6.jpg',
    },
    {
      'name': 'Expert Difficulty',
      'imageUrl': 'https://i.postimg.cc/kgQn8nTp/image.png',
    },
    {
      'name': 'Floral Design',
      'imageUrl':
          'https://i.postimg.cc/9MjZbF2w/image.png',
    },
    {
      'name': 'Glamorous',
      'imageUrl':
          'https://i.postimg.cc/zvdqMMdg/glam-4.jpg',
    },
    {
      'name': 'Glitter',
      'imageUrl':
      'https://i.postimg.cc/1tG2VhQh/download-1.jpg',
    },
    {
      'name': 'Indian',
      'imageUrl':
          'https://i.postimg.cc/XqX9TMjM/100-84.jpg',
    },
    {
      'name': 'Mandala',
      'imageUrl':
      'https://i.postimg.cc/L80nwwGp/mandala-15.jpg',
    },
    {
      'name': 'Medium Difficulty',
      'imageUrl':
          'https://i.postimg.cc/SRHyLj0w/image.png',
    },
    {
      'name': 'Pakistani',
      'imageUrl':
          'https://i.postimg.cc/9MypdyY5/m-d-4.jpg',
    },
    {
      'name': 'Parlour Artist',
      'imageUrl':
          'https://i.postimg.cc/pTVfF3r8/md-33.jpg',
    },
    {
      'name': 'Simple and Easy',
      'imageUrl':
          'https://i.postimg.cc/nrgJzZWT/c044a06f544eb65595d8b967b5826a5b.jpg',
    },
    {
      'name': 'Traditional',
      'imageUrl':
          'https://i.postimg.cc/FsfdjgCK/traditional-3.jpg',
    },
    {
      'name': 'Trendy',
      'imageUrl':
          'https://i.postimg.cc/g2VGqsXV/trendy-20.jpg',
    },
  ];


  final List<Map<String, String>> featuredDesigns = [
    { 'title': 'Design 1', 'imageUrl': 'https://i.postimg.cc/W4GYT9yY/9.jpg' },
    { 'title': 'Design 2', 'imageUrl': 'https://i.postimg.cc/8PYpqY6H/2.jpg' },
    { 'title': 'Design 3', 'imageUrl': 'https://i.postimg.cc/ZqtTqyjv/3.jpg' },
    { 'title': 'Design 4', 'imageUrl': 'https://i.postimg.cc/PqWdvrF3/4.jpg' },
    { 'title': 'Design 5', 'imageUrl': 'https://i.postimg.cc/vBGbrFJQ/5.jpg' },
    { 'title': 'Design 6', 'imageUrl': 'https://i.postimg.cc/SNw6RGPG/333-1.jpg' },
    { 'title': 'Design 7', 'imageUrl': 'https://i.postimg.cc/4y0zzvxs/333-2.jpg' },
    { 'title': 'Design 8', 'imageUrl': 'https://i.postimg.cc/59KqdJqT/333-3.jpg' },
    { 'title': 'Design 9', 'imageUrl': 'https://i.postimg.cc/tC1d9cBT/333-4.jpg' },
    { 'title': 'Design 10', 'imageUrl': 'https://i.postimg.cc/9QZG775H/333-5.jpg' },
    { 'title': 'Design 11', 'imageUrl': 'https://i.postimg.cc/3R3SRX58/11.jpg' },
    { 'title': 'Design 12', 'imageUrl': 'https://i.postimg.cc/kMfZ2pgk/12.jpg' },
    { 'title': 'Design 13', 'imageUrl': 'https://i.postimg.cc/tCcM5nPk/13.jpg' },
    { 'title': 'Design 14', 'imageUrl': 'https://i.postimg.cc/R0KyqCWR/14.jpg' },
    { 'title': 'Design 15', 'imageUrl': 'https://i.postimg.cc/1XjJJbgX/15.jpg' },
    { 'title': 'Design 16', 'imageUrl': 'https://i.postimg.cc/pL9gbJx3/16.jpg' },
    { 'title': 'Design 17', 'imageUrl': 'https://i.postimg.cc/fL5H0VDx/17.jpg' },
    { 'title': 'Design 18', 'imageUrl': 'https://i.postimg.cc/JzBdd75L/18.jpg' },
    { 'title': 'Design 19', 'imageUrl': 'https://i.postimg.cc/YqDJssc1/19.jpg' },
    { 'title': 'Design 20', 'imageUrl': 'https://i.postimg.cc/T277d5kx/20.jpg' },
    { 'title': 'Design 21', 'imageUrl': 'https://i.postimg.cc/bJPMnXbj/21.jpg' },
    { 'title': 'Design 22', 'imageUrl': 'https://i.postimg.cc/BQbzHB8t/22.jpg' },
    { 'title': 'Design 23', 'imageUrl': 'https://i.postimg.cc/Qxd2Srz8/24.jpg' },
    { 'title': 'Design 24', 'imageUrl': 'https://i.postimg.cc/d3txW84H/6.jpg' },
    { 'title': 'Design 25', 'imageUrl': 'https://i.postimg.cc/bwK4zSwr/7.jpg' },
    { 'title': 'Design 26', 'imageUrl': 'https://i.postimg.cc/vTqSCcKQ/8.jpg' },
  ];

  @override
  void initState() {
    super.initState();

    // Top Banner Ad
    _topBannerAd = BannerAd(
      adUnitId: 'ca-app-pub-4606622080198170/9220415284', // Replace with your actual ad unit ID
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isTopAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    )..load();
    _botBannerAd = BannerAd(
      adUnitId: 'ca-app-pub-4606622080198170/9220415284', // Replace with your actual ad unit ID
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isbotAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    )..load();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text('Mehendi Designs', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.grey,
      ),
      drawer: const CustomDrawer(), // <- Add this line
      body: Column(
        children: [
          // Banner Ad at the top
          if (_isTopAdLoaded)
            Container(
              width: double.infinity,
              height: 40,
              child: AdWidget(ad: _topBannerAd),
            ),

          // Featured Design Carousel
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(12.0),
              color: AppColors.background,
              shadowColor: Colors.grey.withOpacity(0.5),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 150,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                  ),
                  items: featuredDesigns.map((design) {
                    return GestureDetector(
                      onTap: () {
                        final index = featuredDesigns.indexOf(design);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DesignViewer(
                              designs: featuredDesigns,
                              initialIndex: index,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            design['imageUrl']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          // Expanded Grid for Categories
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 5 / 4,
                ),
                itemCount: categories.length, // Removed +1
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CategoryCard(
                    name: category['name']!,
                    imageUrl: category['imageUrl']!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryScreen(
                            categoryName: category['name']!,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          if (_isbotAdLoaded)
            Container(
              width: double.infinity,
              height: 40,
              child: AdWidget(ad: _botBannerAd),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _topBannerAd.dispose(); // Dispose the top banner ad
    _gridBannerAd.dispose(); // Dispose the grid banner ad
    super.dispose();
  }
}
