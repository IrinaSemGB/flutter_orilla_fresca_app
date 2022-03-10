import 'package:flutter/material.dart';
import 'icon_font_widget.dart';

class CategoryIcon extends StatelessWidget {

  final String icon;
  final Color color;
  final double size;

  CategoryIcon({
    required this.icon,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: color,
        padding: EdgeInsets.all(10.0),
        child: IconFont(
          iconName: icon,
          color: Colors.white,
          size: size,
        ),
      ),
    );
  }
}