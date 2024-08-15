import 'package:flutter/material.dart';
import 'package:flutter_first_ui/themes/custom_theme.dart';

class ThemeModeModel with ChangeNotifier {
  bool isDarkMode = false;

  void updateMode({required bool darkMode}) {
    isDarkMode = darkMode;
    notifyListeners();
  }
}
