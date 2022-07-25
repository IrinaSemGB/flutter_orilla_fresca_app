import 'package:flutter/material.dart';
import 'package:orilla_fresca/helpers/constants.dart';
import 'package:orilla_fresca/helpers/utils.dart';
import 'package:orilla_fresca/models/subcategory.dart';
import 'package:orilla_fresca/services/cart_service.dart';
import 'package:orilla_fresca/widgets/icon_font_widget.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';


class ShoppingListPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    CartService cartService = Provider.of<CartService>(context, listen: false);

    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.shopping_cart, color: AppColors.GREEN),
              SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  'Shopping Cart',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Consumer<CartService>(
                builder: (context, cart, child) {
                  if (cart.items.length > 0) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            cartService.removeAll(context);
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 20.0, right: 20.0),
                            child: Row(
                              children: [
                                Icon(Icons.delete, color: AppColors.GREEN),
                                SizedBox(width: 5.0),
                                Text(
                                  'Remove All',
                                  style: TextStyle(
                                    color: AppColors.DARK_GREEN,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: AppColors.GREEN.withOpacity(0.2),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
          Consumer<CartService>(
            builder: (context, cart, child) {

              List<Widget> cartItems = [];
              double mainTotal = 0;

              if (cart.items.length > 0) {

                cart.items.forEach((CartItem item) {
                  SubCategory itemSubcategory = (item.category as SubCategory);
                  double total = itemSubcategory.amount * itemSubcategory.price;
                  mainTotal += total;

                  cartItems.add(
                    Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10.0,
                            offset: Offset.zero,
                          ),
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              './assets/images/' + itemSubcategory.imageName.toString() + '.png',
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  itemSubcategory.name.toString(),
                                  style: TextStyle(
                                    color: itemSubcategory.color,
                                  ),
                                ),
                                Text(
                                  '${itemSubcategory.amount} ${Utils.weightUnitToString(itemSubcategory.unit)}',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  '\$${total.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: itemSubcategory.color,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              cart.remove(context, item);
                            },
                            icon: Icon(
                              Icons.highlight_off,
                              size: 30.0,
                              color: AppColors.GREEN,
                            ),
                          ),
                        ],
                      ),
                    )
                  );
                });
              } else {
                return Expanded(
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconFont(
                            iconName: IconFontHelper.LOGO,
                            color: AppColors.GREEN,
                            size: 30.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.0, right: 20.0),
                            width: 2.0,
                            height: 50.0,
                            color: Colors.grey[400],
                          ),
                          Text(
                            'There are\nno selected products\nin the cart',
                            style: TextStyle(
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 20.0),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: SingleChildScrollView(
                            child: Column(children: cartItems),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconFont(
                              iconName: IconFontHelper.LOGO,
                              color: AppColors.GREEN,
                              size: 40.0,
                            ),
                            SizedBox(width: 10.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Total: \$${mainTotal.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: AppColors.GREEN,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
