import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static RewardedInterstitialAd? _rewardedInterstitialAd;
  static bool _isAdReady = false;

  static bool get isAdReady => _isAdReady; // Add this getter to access readiness status

  static void loadRewardedInterstitialAd() {
    RewardedInterstitialAd.load(
      adUnitId: 'ca-app-pub-4606622080198170/1186846745', // Replace with your unit
      request: AdRequest(),
      rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedInterstitialAd = ad;
          _isAdReady = true;
        },
        onAdFailedToLoad: (error) {
          _isAdReady = false;
          print('Rewarded Interstitial failed to load: $error');
        },
      ),
    );
  }

  static void showAdIfReady(Function onRewardEarned) {
    print('Is ad ready? $_isAdReady');
    if (_isAdReady && _rewardedInterstitialAd != null) {
      _rewardedInterstitialAd!.show(
        onUserEarnedReward: (ad, reward) {
          onRewardEarned(); // unlock 6th design
        },
      );
      _rewardedInterstitialAd = null;
      _isAdReady = false;
      loadRewardedInterstitialAd(); // preload next one
    } else {
      print('Ad not ready, fallback to proceed');
      onRewardEarned(); // fallback if ad isn't ready
    }
  }
}
