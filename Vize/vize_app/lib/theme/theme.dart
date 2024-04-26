import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Color(0xFFFFFFFF),
    primary: Color(0xFFEF6C00),
    primaryContainer: Color.fromARGB(255, 0, 0, 0),
    secondary: Color(0xFFEF6C00),
    secondaryContainer: Color.fromARGB(255, 207, 207, 207),
    onPrimary: Color(0xFFFFFFFF),
    onPrimaryContainer: Color.fromARGB(255, 255, 255, 255),
    onSecondary: Color(0xFFFFFFFF),
    onSecondaryContainer: Color(0xFF101314),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF181A1D),
    primary: Color(0xFFEF6C00),
    primaryContainer: Color(0xFF000000),
    secondary: Color(0xFFEF6C00),
    secondaryContainer: Color(0xFF2D2D2D),
    onPrimary: Color(0xFF101314),
    onPrimaryContainer: Color(0xFFFFFFFF),
    onSecondary: Color(0xFF0E1414),
    onSecondaryContainer: Color(0xFFFFFFFF),
  ),
);
