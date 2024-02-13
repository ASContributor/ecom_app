import 'package:flutter/material.dart';

class CTheme {
  static ThemeData DarkTheam = ThemeData(
      appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
  ));
  static ThemeData LightRheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    colorScheme:
        ColorScheme.fromSeed(seedColor: Colors.black, background: Colors.white),
    useMaterial3: true,
  );
  static bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }
}
