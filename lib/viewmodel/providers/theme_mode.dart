import 'package:flutter/material.dart';

class ThemeModeModel with ChangeNotifier {
  bool isDarkMode = false;

  void updateMode({required bool darkMode}) {
    isDarkMode = darkMode;
    notifyListeners();
  }

  void toggleTheme() {}
}
