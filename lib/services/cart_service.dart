import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:orilla_fresca/models/cart_item.dart';
import 'package:orilla_fresca/models/subcategory.dart';

class CartService extends ChangeNotifier {

  final List<CartItem> _items = [];

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  void add(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  bool isCategoryAddedToCart(SubCategory cat) {
    return _items.length > 0
      ? _items.any((CartItem item) => item.category!.name == cat.name)
      : false;
  }
}