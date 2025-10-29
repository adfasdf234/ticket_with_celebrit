import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

  primaryColor: Color(0xFFFF77A9),
  scaffoldBackgroundColor: Colors.black,

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Color(0xFFFF77A9),
    elevation: 0,
    shape: Border(bottom: BorderSide(color: Color(0xFFFF77A9), width: 1.0)),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFFF77A9),
      foregroundColor: Colors.white,
    ),
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Color(0xFFFF77A9),fontSize: 30),
    bodyMedium: TextStyle(color: Colors.black),
  ),

  cardColor: Colors.grey[900],

  colorScheme: ColorScheme.dark(
    primary: Color(0xFFFF77A9),
    secondary: Colors.black,
    surface: Colors.white,
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFF77A9),
    foregroundColor: Colors.black,
  ),
);

