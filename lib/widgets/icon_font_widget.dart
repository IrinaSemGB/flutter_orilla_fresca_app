import 'package:flutter/material.dart';

class IconFontHelper {
  static const String LOGO = 'a';
  static const String MAIN_LOGO = 'b';
  static const String MEATS = 'c';
  static const String PASTRIES = 'd';
  static const String SEEDS = 'e';
  static const String SPICES = 'f';
  static const String VEGS = 'g';
  static const String FRUITS = 'h';
}

class IconFont extends StatelessWidget {

  final String iconName;
  final Color color;
  final double size;

  IconFont({
    required this.iconName,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      iconName,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'orilla',
      ),
    );
  }
}