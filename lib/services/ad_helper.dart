import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-7173006780619406/3659271844';
    }

    if (Platform.isIOS) {
      return 'ca-app-pub-7173006780619406/7490600444';
    }

    throw UnsupportedError('Unsupported platform');
  }
}
