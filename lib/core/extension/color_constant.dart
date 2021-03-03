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
  
}
