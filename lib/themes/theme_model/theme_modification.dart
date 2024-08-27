import 'package:flutter/material.dart';

//this class is used to change the theme of the app
class ThemeModification with ChangeNotifier {
//this is the boolean value which is used to check if the dark mode is enabled or not
  bool isDarkMode =
      false; 

//this method is used to update the theme of the app
  void updateMode({required bool darkMode}) {
    isDarkMode = darkMode;
    notifyListeners(); 
    //this method is used to notify the listeners that the value has been changed 
    //and the UI should be updated accordingly
  }
}
