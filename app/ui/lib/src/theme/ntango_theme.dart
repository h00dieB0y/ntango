import 'package:flutter/material.dart';

/// Light Theme
final ThemeData ntangoLightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF008B8B),   // Teal (logo highlights)
    onPrimary: Colors.white,
    secondary: Color(0xFFC47F3B), // Copper/Gold (logo ring)
    onSecondary: Colors.white,
    surface: Color(0xFFFFFFFF),
    onSurface: Colors.black,
    error: Color(0xFFBA1A1A),
    onError: Colors.white,
  ),
  scaffoldBackgroundColor: const Color(0xFFF9F9F9),

  // Optional font family
  fontFamily: 'Roboto',

  // Example app bar styling
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF008B8B), // primary color
    foregroundColor: Colors.white,      // text/icon color
    elevation: 0,
  ),

  // Example elevated button styling
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFC47F3B), // secondary color
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
  ),
);

/// Dark Theme
final ThemeData ntangoDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF008B8B),   // Teal (logo highlights)
    onPrimary: Colors.white,
    secondary: Color(0xFFC47F3B), // Copper/Gold (logo ring)
    onSecondary: Colors.white,
    surface: Color(0xFF303841),
    onSurface: Colors.white,
    error: Color(0xFFFFB4A2),
    onError: Colors.black,
  ),
  scaffoldBackgroundColor: const Color(0xFF303841),

  // Same font or different if you prefer
  fontFamily: 'Roboto',

  // Example app bar styling
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF008B8B), // primary color
    foregroundColor: Colors.white,
    elevation: 0,
  ),

  // Example elevated button styling
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFC47F3B), // secondary color
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
  ),
);
