import 'package:flutter/material.dart';

class AppDetails {
  static final String appName = "DiSCo";
  static final String appTitle = "Dice Scoring Controller";

  static ThemeData buildTheme(Brightness brightness) {
    final seedColor = Colors.lightBlue;
    final colorScheme = ColorScheme.fromSeed(seedColor: seedColor, brightness: brightness);
    return ThemeData(
      brightness: brightness,
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: "Jost",
      appBarTheme: AppBarTheme(backgroundColor: colorScheme.primary, foregroundColor: colorScheme.onPrimary),
    );
  }
}
