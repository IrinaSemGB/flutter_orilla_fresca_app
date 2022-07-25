import 'dart:ui';
import 'package:orilla_fresca/models/subcategory.dart';

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

  factory Category.fromJson(Map<String, dynamic> json) {

    return Category(
      color: Color(int.parse('0xFF' + json['color'])),
      icon: json['icon'],
      name: json['name'],
      imageName: json['imageName'],
      subCategories: SubCategory.fromJsonArray(json['subCategories']),
    );
  }
}

