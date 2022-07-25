import 'package:flutter/material.dart';
import 'package:orilla_fresca/helpers/utils.dart';
import 'package:orilla_fresca/models/category.dart';
import 'package:orilla_fresca/services/category_selection_service.dart';
import 'package:orilla_fresca/services/category_service.dart';
import 'package:provider/provider.dart';
import '../widgets/category_card_widget.dart';

class CategoriesPage extends StatelessWidget {

  List<Category> categories = [];

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    CategoryService catService = Provider.of<CategoryService>(context, listen: false);

    categories = catService.getCategories();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Choose the category',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.only(bottom: screenHeight * 0.13),
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(
                  category: categories[index],
                  onClickCard: () {
                    catSelection.selectedCategory = categories[index];
                    Utils.mainAppNav.currentState?.pushNamed('/selected_category_page');
                  },
                );
              }),
        ),
      ],
    );
  }
}
