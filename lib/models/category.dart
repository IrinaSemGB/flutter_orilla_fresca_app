import 'dart:ui';


class Category {
  String name;
  String icon;
  Color color;
  String imageName;
  List<Category> subCategories;

  Category({
    required this.name,
    required this.icon,
    required this.color,
    required this.imageName,
    required this.subCategories
  });
}