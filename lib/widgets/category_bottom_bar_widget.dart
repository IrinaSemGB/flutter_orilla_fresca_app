import 'package:flutter/material.dart';
import 'package:orilla_fresca/widgets/tabbar_icon_button_widget.dart';

class CategoryBottomBar extends StatelessWidget {

  final double screenHeight;

  CategoryBottomBar({
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.13,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Colors.black.withOpacity(0.2),
            offset: Offset.zero,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabBarIconButton(
              icon: Icons.favorite,
              onPressed: () {},
            ),
            TabBarIconButton(
              icon: Icons.shopping_cart,
              onPressed: () {},
            ),
            TabBarIconButton(
              icon: Icons.pin_drop,
              onPressed: () {},
            ),
            TabBarIconButton(
              icon: Icons.settings,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}