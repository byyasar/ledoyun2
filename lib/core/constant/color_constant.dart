import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants instance = ColorConstants._init();
  ColorConstants._init();

  final appleBlossom = Color(0xffb04b4b);
  final white = Color(0xFFECECEC);
  final red = Colors.red;
  final blueAccent = Colors.blueAccent;
  final Color bgColor = Color(0xFF2D2F41);
  final List<Color> ledOffColor = [Color(0xFF3C3F58), Color(0xFF3C3F58)];
  final List<Color> ledOnColor = [Colors.red, Colors.red[800]];
  final List<Color> ledRandomColor = [Colors.blue, Colors.blue[800]];
  final List<Color> ledShowColor = [Colors.yellow, Colors.yellow[800]];
  
  final ThemeData myTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    primaryColor: Color( 0xff2196f3 ),
    primaryColorBrightness: Brightness.dark,
    primaryColorLight: Color( 0xffbbdefb ),
    primaryColorDark: Color( 0xff1976d2 ),
    accentColor: Color( 0xff2196f3 ),
    accentColorBrightness: Brightness.dark,
    canvasColor: Color( 0xfffafafa ),
    );
}
