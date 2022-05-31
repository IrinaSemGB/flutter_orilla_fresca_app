import 'package:flutter/material.dart';
import 'package:orilla_fresca/helpers/utils.dart';
import 'package:orilla_fresca/models/category.dart';
import 'package:orilla_fresca/services/category_selection_service.dart';
import 'package:orilla_fresca/widgets/main_app_bar_widget.dart';
import 'package:orilla_fresca/widgets/side_bar_menu.dart';
import 'package:provider/provider.dart';
import '../widgets/category_bottom_bar_widget.dart';
import '../widgets/category_card_widget.dart';


class CategoriesPage extends StatelessWidget {

  final List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);

    return Scaffold(
      appBar: MainAppBar(),
      drawer: Drawer(
        child: SideBarMenu(),
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
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
                            Navigator.of(context).pushNamed('/selected_category_page');
                          },
                        );
                      }),
                ),
              ],
            ),
            Positioned(
              right: 0.0,
              left: 0.0,
              bottom: 0.0,
              child: CategoryBottomBar(
                screenHeight: screenHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




