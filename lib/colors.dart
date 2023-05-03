import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFFBE4ED),
  100: Color(0xFFF5BCD2),
  200: Color(0xFFEE8FB4),
  300: Color(0xFFE76295),
  400: Color(0xFFE2417F),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFFD91B60),
  700: Color(0xFFD41755),
  800: Color(0xFFCF124B),
  900: Color(0xFFC70A3A),
});
const int _primaryPrimaryValue = 0xFFDD1F68;

const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFFFF1F4),
  200: Color(_primaryAccentValue),
  400: Color(0xFFFF8BA3),
  700: Color(0xFFFF728F),
});
const int _primaryAccentValue = 0xFFFFBECC;