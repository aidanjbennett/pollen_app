import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:pollen_app/services/ad_helper.dart';
import 'package:pollen_app/services/consent_service.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key, this.padding = EdgeInsets.zero});

  final EdgeInsetsGeometry padding;

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isLoading && _bannerAd == null) {
      _loadAd();
    }
  }

  Future<void> _loadAd() async {
    if (!ConsentService.instance.canRequestAds) {
      return;
    }

    _isLoading = true;

    final width = MediaQuery.sizeOf(context).width.truncate();

    final adaptiveSize = await AdSize.getLargeAnchoredAdaptiveBannerAdSize(
      width,
    );

    if (!mounted || adaptiveSize == null) {
      _isLoading = false;
      return;
    }

    final bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: adaptiveSize,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }

          setState(() {
            _bannerAd = ad as BannerAd;
            _isLoaded = true;
            _isLoading = false;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();

          if (!mounted) {
            return;
          }

          setState(() {
            _bannerAd = null;
            _isLoaded = false;
            _isLoading = false;
          });

          debugPrint('Banner failed to load: $error');
        },
      ),
    );

    bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _bannerAd = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bannerAd = _bannerAd;

    if (!_isLoaded || bannerAd == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: widget.padding,
      child: Center(
        child: SizedBox(
          width: bannerAd.size.width.toDouble(),
          height: bannerAd.size.height.toDouble(),
          child: AdWidget(ad: bannerAd),
        ),
      ),
    );
  }
}
