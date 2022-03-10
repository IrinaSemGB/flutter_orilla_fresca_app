import 'package:flutter/material.dart';
import 'package:orilla_fresca/helpers/constants.dart';
import 'package:orilla_fresca/helpers/utils.dart';
import 'package:orilla_fresca/models/category.dart';
import 'package:orilla_fresca/widgets/icon_font_widget.dart';
import '../widgets/category_card_widget.dart';


class CategoriesPage extends StatelessWidget {

  final List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: IconFont(
          iconName: IconFontHelper.LOGO,
          color: AppColors.GREEN,
          size: 40.0,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: AppColors.GREEN,
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            padding: EdgeInsets.all(10.0),
            child: ClipOval(
              child: Image.asset('assets/images/me.png'),
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Container(
        child: Column(
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
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryCard(
                    category: categories[index],
                  );
                }),
            ),
          ],
        ),
      ),
    );
  }
}


