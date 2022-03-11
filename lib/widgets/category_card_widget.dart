import 'package:flutter/material.dart';
import '../models/category.dart';
import 'category_icon_widget.dart';

class CategoryCard extends StatelessWidget {

  final Category category;
  final void Function()? onClickCard;

  CategoryCard({
    required this.category,
    required this.onClickCard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClickCard,
      child: Container(
        margin: EdgeInsets.all(20.0),
        height: 150.0,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/images/' + category.imageName + '.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 0.0,
              left: 0.0,
              bottom: 0.0,
              child: Container(
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10.0,
              bottom: 10.0,
              child: Row(
                children: [
                  CategoryIcon(
                    icon: category.icon,
                    color: category.color,
                    size: 30.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    category.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}