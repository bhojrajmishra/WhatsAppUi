import 'package:flutter/material.dart';

class LoadingViewModel extends ChangeNotifier {
  bool isLoading = false;

  void updateLoading({required bool loading}) {
    isLoading = loading;
    notifyListeners();
  }
}
