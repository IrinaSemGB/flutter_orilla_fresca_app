import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:orilla_fresca/models/subcategory.dart';
import 'package:orilla_fresca/services/cart_service.dart';
import 'package:provider/provider.dart';
import '../models/category.dart';
import 'login_service.dart';

class CategorySelectionService extends ChangeNotifier {

  Category? _selectedCategory;
  SubCategory? _selectedSubCategory;

  Category? get selectedCategory => _selectedCategory;
  set selectedCategory(Category? value) {
    _selectedCategory = value;
    notifyListeners();
  }

  SubCategory? get selectedSubCategory => _selectedSubCategory;
  set selectedSubCategory(SubCategory? value) {
    _selectedSubCategory = value;
    notifyListeners();
  }

  void incrementSubCategoryAmount(BuildContext context) {
    if (_selectedSubCategory != null) {

      LoginService loginService = Provider.of<LoginService>(context, listen: false);
      CartService cartService = Provider.of<CartService>(context, listen: false);

      if (cartService.isSubCategoryAddedToCart(_selectedSubCategory!)) {
        FirebaseFirestore.instance
            .collection('shoppers')
            .doc(loginService.loggedInUserModel?.uid)
            .update({
          'cartItems.${_selectedSubCategory?.imageName}':
              FieldValue.increment(1)
        }).then((value) {
          _selectedSubCategory!.amount++;
          notifyListeners();
        });
      } else {
        _selectedSubCategory!.amount++;
        notifyListeners();
      }
    }
  }

  void decrementSubCategoryAmount(BuildContext context) {
    if (_selectedSubCategory != null) {

      LoginService loginService = Provider.of<LoginService>(context, listen: false);
      CartService cartService = Provider.of<CartService>(context, listen: false);

      if (cartService.isSubCategoryAddedToCart(_selectedSubCategory!)) {
        FirebaseFirestore.instance
            .collection('shoppers')
            .doc(loginService.loggedInUserModel?.uid)
            .update({
          'cartItems.${_selectedSubCategory?.imageName}':
          FieldValue.increment(-1)
        }).then((value) {
          _selectedSubCategory!.amount--;
          notifyListeners();
        });
      } else {
        _selectedSubCategory!.amount--;
        notifyListeners();
      }
    }
  }

  int get subCategoryAmount {
    int subCatAmount = 0;
    if (_selectedSubCategory != null) {
      subCatAmount = _selectedSubCategory!.amount;
    }
    return subCatAmount;
  }
}