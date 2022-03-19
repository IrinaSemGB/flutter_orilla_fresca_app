import 'package:flutter/material.dart';
import 'package:orilla_fresca/models/category.dart';
import 'package:orilla_fresca/widgets/category_icon_widget.dart';
import 'package:orilla_fresca/widgets/main_app_bar_widget.dart';

import 'details_page.dart';

class SelectedCategoryPage extends StatelessWidget {

  final Category selectedCategory;

  SelectedCategoryPage({ required this.selectedCategory });

  @override
  Widget build(BuildContext context) {

    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryIcon(
                    icon: selectedCategory.icon,
                    color: selectedCategory.color,
                    size: 20.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    selectedCategory.name,
                    style: TextStyle(
                      color: selectedCategory.color,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  selectedCategory.subCategories.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DetailsPage(
                            subCategory: selectedCategory.subCategories[index],
                          )),
                        );
                      },
                      child: Container(
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/images/'
                                    + selectedCategory.subCategories[index].imageName
                                    + '.png',
                                fit: BoxFit.cover,
                                width: widthScreen * 0.3,
                                height: widthScreen * 0.3,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(selectedCategory.subCategories[index].name,),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
