import 'dart:io';

import 'package:flutter/foundation.dart';

class AdHelper {
  static String get bannerAdUnitId {
    if (kDebugMode) {
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/9214589741';
      }

      if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/2435281174';
      }
    }

    if (Platform.isAndroid) {
      return 'ca-app-pub-7173006780619406/3659271844';
    }

    if (Platform.isIOS) {
      return 'ca-app-pub-7173006780619406/7490600444';
    }

    throw UnsupportedError('Unsupported platform');
  }
}
