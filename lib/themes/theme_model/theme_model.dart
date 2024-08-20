import 'package:flutter/material.dart';

class ThemeModel with ChangeNotifier {
  bool isDarkMode = false;

  void updateMode({required bool darkMode}) {
    isDarkMode = darkMode;
    notifyListeners();
  }
}
