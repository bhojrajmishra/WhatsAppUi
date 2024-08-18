import 'package:flutter/material.dart';

class LoadingScreen extends ChangeNotifier {
  bool isLoading = false;

  void updateLoading({required bool loading}) {
    isLoading = loading;
    notifyListeners();
  }
}
