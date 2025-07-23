// lib/themes.dart

import 'package:flutter/material.dart';

final Color mainGreen = Color(0xFF06923E);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: mainGreen,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    primary: mainGreen,
    onPrimary: Colors.white,
    background: Colors.white,
    onBackground: Colors.black87,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: mainGreen,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.black87),
    titleLarge: TextStyle(color: mainGreen, fontWeight: FontWeight.bold),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: mainGreen,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.dark(
    primary: mainGreen,
    onPrimary: Colors.black,
    background: Colors.black,
    onBackground: Colors.white70,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: mainGreen,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[900],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: Colors.white54),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.white70),
    titleLarge: TextStyle(color: mainGreen, fontWeight: FontWeight.bold),
  ),
);
