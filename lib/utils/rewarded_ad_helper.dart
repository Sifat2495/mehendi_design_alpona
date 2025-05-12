import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdHelper {
  static RewardedAd? _rewardedAd;
  static bool _isAdLoading = false;

  // Replace this with your real ad unit ID
  static const String _adUnitId = 'ca-app-pub-4606622080198170/2499928412'; // Test ID

  /// Load and show the rewarded ad
  static void showRewardedAd({
    required BuildContext context,
    required VoidCallback onRewardEarned,
    VoidCallback? onAdFailed,
  }) {
    if (_isAdLoading) return;

    _isAdLoading = true;

    // Show a loading indicator here if needed (in your UI)
    RewardedAd.load(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          _isAdLoading = false;
          _rewardedAd = ad;

          // Handle ad callbacks
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              if (onAdFailed != null) onAdFailed();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ad failed to show.')),
              );
            },
          );

          ad.show(
            onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
              onRewardEarned();
            },
          );
        },
        onAdFailedToLoad: (LoadAdError error) {
          _isAdLoading = false;
          if (onAdFailed != null) onAdFailed();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Ad failed to load.')),
          );
        },
      ),
    );
  }

  // Dispose of the ad when it's no longer needed (to avoid memory leaks)
  static void dispose() {
    _rewardedAd?.dispose();
    _rewardedAd = null;
  }
}
