import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xffDD7230),
    elevation: 0,
  ),
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color(0xffDD7230),
    primary: Color(0xff854D27),
    secondary: Color(0xff1D3D5B),
  ),
);
