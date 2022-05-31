import 'dart:ui';
import 'package:orilla_fresca/models/category.dart';
import 'package:orilla_fresca/models/category_part.dart';
import '../helpers/unit_nums.dart';

class SubCategory extends Category {

  List<CategoryPart> parts;
  double price;
  WeightUnits unit;
  int amount;

  double getTotalPrice() {
    return this.amount * this.price;
  }

  SubCategory({
    this.parts = const [],
    this.price = 0.0,
    this.unit = WeightUnits.Lb,
    this.amount = 0,
    String? name,
    String? icon,
    Color? color,
    String? imageName,
  }) : super(
    name: name,
    icon: icon,
    color: color,
    imageName: imageName,
  );
}