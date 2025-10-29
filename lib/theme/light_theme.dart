import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,

  primaryColor: Color(0xFFFF77A9),
  scaffoldBackgroundColor: Colors.white,

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
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
    displayLarge: TextStyle(color: Color(0xFFFF77A9),fontSize: 50,fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Color(0xFFFF77A9),fontSize: 30,fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(color: Colors.black),
  ),

  cardColor: Colors.white,

  colorScheme: ColorScheme.light(
    primary: Color(0xFFFF77A9),
    secondary: Colors.black,
    surface: Colors.white,
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFF77A9),
    foregroundColor: Colors.white,
  ),
);