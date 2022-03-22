import 'package:flutter/material.dart';
import 'icon_font_widget.dart';

class CategoryIcon extends StatelessWidget {

  final String icon;
  final Color color;
  final double size;
  final double padding;

  CategoryIcon({
    required this.icon,
    required this.color,
    required this.size,
    this.padding = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: color,
        padding: EdgeInsets.all(padding),
        child: IconFont(
          iconName: icon,
          color: Colors.white,
          size: size,
        ),
      ),
    );
  }
}