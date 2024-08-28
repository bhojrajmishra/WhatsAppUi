import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool isLoading = false;
  void updateLoading({required bool loading}) {
    isLoading = loading;
    notifyListeners();
  }
}
