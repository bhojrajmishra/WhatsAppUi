import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.light(
        surface: Colors.white,
        primary: Color.fromARGB(255, 16, 83, 18),
        secondary: Colors.white,
        inversePrimary: Colors.white,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.dark(
        surface: Colors.black,
        primary: Color.fromARGB(255, 16, 83, 18),
        secondary: Colors.white,
        inversePrimary: Colors.grey[400],
      ),
    );
  }
}
