import 'package:flutter/material.dart';

class Colours{
  static Color app_main = Colors.deepPurple;
  static Color text_dark = Color(0xFF333333);
  static Color text_normal = Color(0xFF666666);
  static Color text_gray = Color(0xFF999999);

  static Color divider = Color(0xFFe5e5e5);
  static Color dividerDark = Colors.grey.shade400;

  static Color iconColorGrey = Colors.grey.shade600;

  static const Color gray_33 = Color(0xFF333333); //51
}

Map<String, Color> themeColorMap = {
  'gray': Colours.gray_33,
  'blue': Colors.blue,
  'blueAccent': Colors.blueAccent,
  'cyan': Colors.cyan,
  'deepPurple': Colors.deepPurple,
  'deepPurpleAccent': Colors.deepPurpleAccent,
  'deepOrange': Colors.deepOrange,
  'green': Colors.green,
  'indigo': Colors.indigo,
  'indigoAccent': Colors.indigoAccent,
  'orange': Colors.orange,
  'purple': Colors.purple,
  'pink': Colors.pink,
  'red': Colors.red,
  'teal': Colors.teal,
  'black': Colors.black,
};