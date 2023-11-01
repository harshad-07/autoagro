import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme (BuildContext context) => ThemeData(
    primarySwatch: primary,
  );

  static ThemeData darkTheme (BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    primarySwatch: primary
  );
}

 const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFECECFC),
  100: Color(0xFFCFCFF7),
  200: Color(0xFFAFAFF2),
  300: Color(0xFF8F8FEC),
  400: Color(0xFF7777E8),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF5757E1),
  700: Color(0xFF4D4DDD),
  800: Color(0xFF4343D9),
  900: Color(0xFF3232D1),
});
const int _primaryPrimaryValue = 0xFF5F5FE4;

const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_primaryAccentValue),
  400: Color(0xFFB1B1FF),
  700: Color(0xFF9797FF),
});
const int _primaryAccentValue = 0xFFE4E4FF;