import 'package:orilla_fresca/models/category.dart';

class CartItem {
  final Category? category;
  final int units;

  CartItem({
    required this.category,
    this.units = 0
  });
}