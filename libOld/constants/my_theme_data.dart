import 'package:flutter/material.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.amber,
      foregroundColor: Colors.black,
      elevation: 1
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
  );
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: const Color.fromARGB(255, 124, 7, 7),
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      elevation: 1
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 106, 7)),
  );
}