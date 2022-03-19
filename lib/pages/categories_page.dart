import 'package:flutter/material.dart';
import 'package:orilla_fresca/helpers/utils.dart';
import 'package:orilla_fresca/models/category.dart';
import 'package:orilla_fresca/pages/selected_category_page.dart';
import 'package:orilla_fresca/widgets/main_app_bar_widget.dart';
import '../widgets/category_bottom_bar_widget.dart';
import '../widgets/category_card_widget.dart';


class CategoriesPage extends StatelessWidget {

  final List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MainAppBar(),
      drawer: Drawer(),
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
                            Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) => SelectedCategoryPage(
                                  selectedCategory: categories[index],
                                )
                              ),
                            );
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




