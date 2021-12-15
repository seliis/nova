import "package:flutter/material.dart";

class MainGate with ChangeNotifier {
  String _mainGateState = "login";
  String get mainGateState => _mainGateState;

  void setMainGateToLogin() {
    if (_mainGateState != "login") {
      _mainGateState = "login";
      notifyListeners();
    }
  }

  void setMainGateToRegistration() {
    if (_mainGateState != "registration") {
      _mainGateState = "registration";
      notifyListeners();
    }
  }
}