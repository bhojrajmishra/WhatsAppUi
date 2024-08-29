import 'package:flutter/material.dart';

/// A custom theme class that defines the light and dark themes for the application.
///
/// This class provides static getters for accessing theme attributes and methods
/// for creating light and dark [ThemeData] objects.
class CustomTheme {
  // Light theme color getters
  static Color get lightSurfaceColor => Colors.white;
  static Color get lightPrimaryColor => const Color.fromARGB(255, 16, 83, 18);
  static Color get lightSecondaryColor => Colors.white;
  static Color get lightInversePrimaryColor => Colors.white;

  // Dark theme color getters
  static Color get darkSurfaceColor => Colors.black;
  static Color get darkPrimaryColor => const Color.fromARGB(255, 16, 83, 18);
  static Color get darkSecondaryColor => Colors.white;
  static Color get darkInversePrimaryColor => Colors.grey[400]!;

  /// Defines the light theme of the app.
  ///
  /// This method returns a [ThemeData] object configured with a [ColorScheme.light]
  /// using the colors defined by the light theme getters.
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.light(
        surface: lightSurfaceColor,
        primary: lightPrimaryColor,
        secondary: lightSecondaryColor,
        inversePrimary: lightInversePrimaryColor,
      ),
    );
  }

  /// Defines the dark theme of the app.
  ///
  /// This method returns a [ThemeData] object configured with a [ColorScheme.dark]
  /// using the colors defined by the dark theme getters.
  static ThemeData darkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.dark(
        surface: darkSurfaceColor,
        primary: darkPrimaryColor,
        secondary: darkSecondaryColor,
        inversePrimary: darkInversePrimaryColor,
      ),
    );
  }
}
