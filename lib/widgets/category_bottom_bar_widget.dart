import 'package:flutter/material.dart';
import 'package:orilla_fresca/helpers/constants.dart';
import 'package:orilla_fresca/services/cart_service.dart';
import 'package:orilla_fresca/widgets/tabbar_icon_button_widget.dart';
import 'package:provider/provider.dart';

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
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Material(
                color: Colors.white,
                child: InkWell(
                  splashColor: Colors.grey[100],
                  highlightColor: Colors.grey[100],
                  onTap: () {

                  },
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Consumer<CartService>(
                      builder: (context, cart, child) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart, color: AppColors.GREEN),
                            Visibility(
                              visible: cart.items.length > 0,
                              child: Container(
                                margin: EdgeInsets.only(left: 5.0),
                                child: Text(
                                  cart.items.length.toString(),
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: AppColors.GREEN,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
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