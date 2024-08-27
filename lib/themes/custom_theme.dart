import 'package:flutter/material.dart';

//this class is used to define the theme of the app
class CustomTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        surface: Colors.white,
        primary: Color.fromARGB(255, 16, 83, 18),
        secondary: Colors.white,
        inversePrimary: Colors.white,
      ),
    );
  }

//this is used to define the dark theme of the app when the user switches to dark mode
  static ThemeData darkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.dark(
        surface: Colors.black,
        primary: const Color.fromARGB(255, 16, 83, 18),
        secondary: Colors.white,
        inversePrimary: Colors.grey[400],
      ),
    );
  }
}
