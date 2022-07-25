import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:orilla_fresca/models/cart_item.dart';
import 'package:orilla_fresca/models/category.dart';
import 'package:orilla_fresca/models/subcategory.dart';
import 'package:orilla_fresca/services/category_selection_service.dart';
import 'package:orilla_fresca/services/category_service.dart';
import 'package:orilla_fresca/services/login_service.dart';
import 'package:provider/provider.dart';

class CartService extends ChangeNotifier {

  final List<CartItem> _items = [];

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  void add(BuildContext context, CartItem item) {
    _items.add(item);

    LoginService loginService = Provider.of<LoginService>(context, listen: false);

    Map<String, int> cartMap = Map();
    _items.forEach((CartItem item) {
      cartMap[item.category?.imageName as String] = (item.category as SubCategory).amount;
    });

    FirebaseFirestore.instance
    .collection('shoppers')
    .doc(loginService.loggedInUserModel?.uid)
    .set({
      'cartItems': cartMap
    }).then((value) {
      notifyListeners();
    });
  }

  bool isSubCategoryAddedToCart(SubCategory cat) {
    return _items.length > 0
      ? _items.any((CartItem item) => item.category!.name == cat.name)
      : false;
  }

  void remove(BuildContext context, CartItem item) {

    LoginService loginService = Provider.of<LoginService>(context, listen: false);
    SubCategory subCat = (item.category as SubCategory);

    FirebaseFirestore.instance
    .collection('shoppers')
    .doc(loginService.loggedInUserModel?.uid)
    .update({
      'cartItems.${subCat.imageName}': FieldValue.delete()
    }).then((value) {
      (item.category as SubCategory).amount = 0;
      _items.remove(item);
      notifyListeners();
    });
  }

  void removeAll(BuildContext context) {

    LoginService loginService = Provider.of<LoginService>(context, listen: false);

    FirebaseFirestore.instance
    .collection('shoppers')
    .doc(loginService.loggedInUserModel?.uid)
    .update({
      'cartItems': FieldValue.delete()
    }).then((value) {
      _items.forEach((CartItem item) {
        (item.category as SubCategory).amount = 0;
      });
      _items.clear();
      notifyListeners();
    });
  }

  SubCategory getCategoryFromCart(SubCategory cat) {
    SubCategory subCat = cat;

    if (_items.length > 0 && _items.any((CartItem item) => item.category?.name == cat.name)) {
      CartItem cartItem = _items.firstWhere((CartItem item) => item.category?.name == cat.name);

      if (cartItem != null) {
        subCat = cartItem.category as SubCategory;
      }
    }
    return subCat;
  }

  void loadCartItemsFromFirebase(BuildContext context) {

    if (_items.length > 0) {
      _items.clear();
    }

    LoginService loginService = Provider.of<LoginService>(context, listen: false);
    CategoryService catService = Provider.of<CategoryService>(context, listen: false);
    CategorySelectionService categorySelectionService = Provider.of<CategorySelectionService>(context, listen: false);

    if (loginService.isUserLoggedIn()) {
      FirebaseFirestore.instance
          .collection('shoppers')
          .doc(loginService.loggedInUserModel?.uid)
          .get()
          .then((DocumentSnapshot snapshot) {
        Map<String, dynamic> cartItems = snapshot.get(FieldPath(['cartItems']));

        catService.getCategories().forEach((Category cat) {
          cat.subCategories?.forEach((Category subCategory) {
            if (cartItems.keys.contains(subCategory.imageName)) {
              var amount = cartItems[subCategory.imageName] as int;
              (subCategory as SubCategory).amount = amount;

              _items.add(CartItem(category: subCategory));

              if (categorySelectionService.selectedCategory != null &&
                  categorySelectionService.selectedCategory?.name ==
                      subCategory.name) {
                categorySelectionService.selectedSubCategory = subCategory;
              }
            }
          });
        });
        notifyListeners();
      });
    }
  }
}