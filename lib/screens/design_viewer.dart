import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../providers/favorites_provider.dart';

class DesignViewer extends StatefulWidget {
  final List<Map<String, String>> designs;
  final int initialIndex;

  const DesignViewer({
    super.key,
    required this.designs,
    required this.initialIndex,
  });

  @override
  State<DesignViewer> createState() => _DesignViewerState();
}

class _DesignViewerState extends State<DesignViewer> {
  late PageController _pageController;
  late int _currentIndex;
  bool _isSwipeLocked = false;

  late BannerAd _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);

    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-4606622080198170/9220415284', // Replace with your Ad Unit ID
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() => _isAdLoaded = true);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _bannerAd.dispose();
    super.dispose();
  }

  void _zoomIn(PhotoViewController controller) {
    final currentScale = controller.scale ?? 1.0;
    controller.scale = currentScale + 0.5;
  }

  void _zoomOut(PhotoViewController controller) {
    final currentScale = controller.scale ?? 1.0;
    if (currentScale > 1.0) {
      controller.scale = currentScale - 0.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.designs[_currentIndex]['title']!),
        actions: [
          IconButton(
            icon: Icon(
              favoritesProvider.isFavorite(widget.designs[_currentIndex])
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: favoritesProvider.isFavorite(widget.designs[_currentIndex])
                  ? Colors.red
                  : Colors.white,
            ),
            onPressed: () {
              final design = widget.designs[_currentIndex];
              if (favoritesProvider.isFavorite(design)) {
                favoritesProvider.removeFromFavorites(design);
              } else {
                favoritesProvider.addToFavorites(design);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (_isAdLoaded)
            SizedBox(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics:
              _isSwipeLocked ? const NeverScrollableScrollPhysics() : null,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemCount: widget.designs.length,
              itemBuilder: (context, index) {
                final design = widget.designs[index];
                final photoController = PhotoViewController();

                return Stack(
                  children: [
                    PhotoView(
                      controller: photoController,
                      imageProvider: NetworkImage(design['imageUrl']!),
                      backgroundDecoration:
                      const BoxDecoration(color: Colors.white),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 3,
                      enableRotation: true,
                    ),
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: 'zoomOut$index',
                            onPressed: () => _zoomOut(photoController),
                            child: const Icon(Icons.zoom_out),
                          ),
                          const SizedBox(width: 20),
                          FloatingActionButton(
                            heroTag: 'zoomIn$index',
                            onPressed: () => _zoomIn(photoController),
                            child: const Icon(Icons.zoom_in),
                          ),
                          const SizedBox(width: 20),
                          FloatingActionButton(
                            heroTag: 'lock$index',
                            onPressed: () {
                              setState(() {
                                _isSwipeLocked = !_isSwipeLocked;
                              });
                            },
                            child: Icon(
                              _isSwipeLocked ? Icons.lock : Icons.lock_open,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
