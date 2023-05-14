import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightPrimary = Color.fromARGB(255, 151, 175, 151);
  static const Color darkPrimary = Color.fromARGB(100, 17, 67, 64);
  static final ThemeData lightTheme = ThemeData(
    cardColor: Colors.white,
    primaryColor: lightPrimary,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
  );
}
