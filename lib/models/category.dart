import 'dart:ui';

class Category {
  String? name;
  String? icon;
  Color? color;
  String? imageName;
  List<Category>? subCategories;

  Category({
    this.name,
    this.icon,
    this.color,
    this.imageName,
    this.subCategories
  });
}