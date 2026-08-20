import 'package:flutter/material.dart';

// TODO: Actually implement this
class HomeViewModel extends ChangeNotifier {
  String? _postCode;
  String? _currentTemperature;

  String? get postCode => _postCode;

  String? get currentTemperature => _currentTemperature;

  void setPostCode(String? value) {
    _postCode = value;
    notifyListeners();
  }

  void setCurrentTemperature(String? value) {
    _currentTemperature = value;
    notifyListeners();
  }

  void updateLocation({String? postCode, String? currentTemperature}) {
    _postCode = postCode;
    _currentTemperature = currentTemperature;

    notifyListeners();
  }
}
