import 'package:flutter/material.dart';
import 'package:orilla_fresca/helpers/constants.dart';
import 'package:orilla_fresca/models/cart_item.dart';
import 'package:orilla_fresca/models/subcategory.dart';
import 'package:orilla_fresca/pages/maps_page.dart';
import 'package:orilla_fresca/services/cart_service.dart';
import 'package:orilla_fresca/widgets/category_icon_widget.dart';
import 'package:orilla_fresca/widgets/main_app_bar_widget.dart';
import 'package:provider/provider.dart';
import '../services/category_selection_service.dart';
import '../widgets/login_button_widget.dart';
import '../widgets/subcaterory_part_list_widget.dart';
import '../widgets/unit_price_widget.dart';

class DetailsPage extends StatefulWidget {

  int amount = 0;
  double price = 15.0;
  double cost = 0.0;

  SubCategory? subCategory;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {

    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    widget.subCategory = catSelection.selectedSubCategory;

    CartService cartService = Provider.of<CartService>(context, listen: false);

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0)),
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/' +
                            widget.subCategory!.imageName! +
                            '.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryIcon(
                            icon: widget.subCategory!.icon!,
                            color: widget.subCategory!.color!,
                            size: 50.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${widget.subCategory?.name}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: widget.subCategory!.color,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  '\$320.00 / kg',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100.0,
                    right: 20.0,
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 5.0,
                        bottom: 8.0,
                        left: 15.0,
                        right: 15.0,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.GREEN,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 20.0,
                            offset: Offset.zero,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Consumer<CartService>(
                            builder: (context, cart, child) {
                              return Text(
                                '${cart.items.length}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              );
                            },
                          ),
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 15.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  MainAppBar(themeColor: Colors.white),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Text(
                        'Select the part you need:',
                      ),
                    ),
                    Visibility(
                      visible: widget.subCategory!.parts.length > 0,
                      child: SubcategoryPartList(
                        subCategory: widget.subCategory!,
                      ),
                    ),
                    UnitPriceWidget(),
                    Consumer<CartService>(
                      builder: (context, cart, child) {
                        Widget renderedButton;
                        if (!cart.isCategoryAddedToCart(widget.subCategory!)) {
                          renderedButton = LoginButton(
                            onPressed: () {
                              cartService.add(
                                CartItem(category: widget.subCategory),
                              );
                            },
                            name: 'Add to shopping card',
                            icon: Icons.shopping_cart,
                            iconColor: Colors.white,
                            nameColor: Colors.white,
                            backgroundColor: AppColors.GREEN,
                            border: BorderSide(
                              color: AppColors.GREEN,
                            ),
                          );
                        } else {
                          renderedButton = Container(
                            padding: EdgeInsets.all(26),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Added to cart',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.GREEN),
                                ),
                                SizedBox(width: 10.0),
                                Icon(Icons.check_circle,
                                    size: 30, color: AppColors.GREEN),
                              ],
                            ),
                          );
                        }
                        return renderedButton;
                      },
                    ),
                    LoginButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapsPage()));
                      },
                      name: 'Location of product',
                      icon: Icons.location_pin,
                      iconColor: Colors.white,
                      nameColor: Colors.white,
                      backgroundColor: AppColors.DARK_GREEN,
                      border: BorderSide(
                        color: AppColors.DARK_GREEN,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
