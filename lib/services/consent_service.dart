import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ConsentService {
  ConsentService._();

  static final ConsentService instance = ConsentService._();

  bool _canRequestAds = false;

  bool get canRequestAds => _canRequestAds;

  Future<void> gatherConsent() async {
    final completer = Completer<void>();

    final params = ConsentRequestParameters();

    ConsentInformation.instance.requestConsentInfoUpdate(
      params,
      () async {
        final consentStatus = await ConsentInformation.instance
            .getConsentStatus();

        final privacyOptionsStatus = await ConsentInformation.instance
            .getPrivacyOptionsRequirementStatus();

        debugPrint('Consent status: $consentStatus');

        debugPrint('Privacy options status: $privacyOptionsStatus');

        ConsentForm.loadAndShowConsentFormIfRequired((FormError? error) async {
          if (error != null) {
            debugPrint(
              'Consent form error '
              '[${error.errorCode}]: ${error.message}',
            );
          } else {
            debugPrint('Consent form completed successfully');
          }

          _canRequestAds = await ConsentInformation.instance.canRequestAds();

          debugPrint('Can request ads: $_canRequestAds');

          if (!completer.isCompleted) {
            completer.complete();
          }
        });
      },
      (FormError error) async {
        debugPrint(
          'Consent info update failed '
          '[${error.errorCode}]: ${error.message}',
        );

        _canRequestAds = await ConsentInformation.instance.canRequestAds();

        debugPrint('Can request ads after error: $_canRequestAds');

        if (!completer.isCompleted) {
          completer.complete();
        }
      },
    );

    await completer.future;
  }

  Future<bool> isPrivacyOptionsRequired() async {
    final status = await ConsentInformation.instance
        .getPrivacyOptionsRequirementStatus();

    return status == PrivacyOptionsRequirementStatus.required;
  }

  Future<void> showPrivacyOptions() async {
    final completer = Completer<void>();

    ConsentForm.showPrivacyOptionsForm((FormError? error) {
      if (error != null) {
        debugPrint(
          'Privacy options form error '
          '[${error.errorCode}]: ${error.message}',
        );
      } else {
        debugPrint('Privacy options form completed successfully');
      }

      if (!completer.isCompleted) {
        completer.complete();
      }
    });

    await completer.future;

    _canRequestAds = await ConsentInformation.instance.canRequestAds();

    debugPrint('Can request ads after privacy update: $_canRequestAds');
  }
}
