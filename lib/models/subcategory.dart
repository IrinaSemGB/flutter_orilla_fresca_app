import 'dart:ui';
import 'package:orilla_fresca/models/category.dart';
import 'package:orilla_fresca/models/category_part.dart';

class SubCategory extends Category {

  List<CategoryPart> parts;

  SubCategory({
    required this.parts,
    required String name,
    required String icon,
    required Color color,
    required String imageName,
  }) : super(
    name: name,
    icon: icon,
    color: color,
    imageName: imageName,
    subCategories: [],
  );
}