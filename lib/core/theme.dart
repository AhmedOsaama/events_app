import 'package:events_app/core/style_utils.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white
  ),
  colorScheme: const ColorScheme.light(),
  textTheme: TextTheme(
    displayLarge: TextStyles.textViewRegular17.copyWith(color: Colors.black),
    displayMedium: TextStyles.textViewRegular14.copyWith(color: Colors.black),
    displaySmall: TextStyles.textViewRegular12.copyWith(color: Colors.black)
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black
  ),
    textTheme: TextTheme(
        displayLarge: TextStyles.textViewRegular17.copyWith(color: Colors.white),
        displayMedium: TextStyles.textViewRegular14.copyWith(color: Colors.white),
        displaySmall: TextStyles.textViewRegular12.copyWith(color: Colors.white)
    ),
);