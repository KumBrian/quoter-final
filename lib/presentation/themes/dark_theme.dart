import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff1D3D5B),
    elevation: 0,
  ),
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color(0xff1D3D5B),
    primary: Color(0xff13293D),
    secondary: Color(0xffDD7230),
  ),
);
