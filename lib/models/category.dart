import 'dart:ui';
import 'package:orilla_fresca/models/subcategory.dart';


class Category {

  final String name;
  final String icon;
  final Color color;
  final String imageName;
  final List<SubCategory> subCategories;

  Category({
    required this.name,
    required this.icon,
    required this.color,
    required this.imageName,
    required this.subCategories
  });
}