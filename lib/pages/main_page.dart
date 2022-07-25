import 'package:flutter/material.dart';
import 'package:orilla_fresca/helpers/utils.dart';
import 'package:orilla_fresca/pages/categories_page.dart';
import 'package:orilla_fresca/pages/favorites_page.dart';
import 'package:orilla_fresca/pages/settings_page.dart';
import 'package:orilla_fresca/pages/shopping_list_page.dart';
import 'package:orilla_fresca/services/cart_service.dart';
import 'package:orilla_fresca/widgets/main_app_bar_widget.dart';
import 'package:orilla_fresca/widgets/side_bar_menu.dart';
import 'package:provider/provider.dart';
import '../widgets/category_bottom_bar_widget.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;

    CartService cartService = Provider.of<CartService>(context, listen: false);
    cartService.loadCartItemsFromFirebase(context);

    return Scaffold(
      appBar: MainAppBar(),
      drawer: Drawer(
        child: SideBarMenu(),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Navigator(
                key: Utils.mainListNav,
                initialRoute: '/',
                onGenerateRoute: (RouteSettings settings) {

                  Widget page;

                  switch(settings.name) {
                    case '/':
                      page = CategoriesPage();
                      break;
                    case '/main_page/favorites_page':
                      page = FavoritesPage();
                      break;
                    case '/main_page/shopping_list_page':
                      page = ShoppingListPage();
                      break;
                    case '/main_page/settings_page':
                      page = SettingsPage();
                      break;
                    default:
                      page = CategoriesPage();
                      break;
                  }
                  return PageRouteBuilder(
                    pageBuilder: (_, __, ___) => page,
                    transitionDuration: Duration(seconds: 0),
                  );
                },
              ),
            ),
            CategoryBottomBar(
              screenHeight: screenHeight,
            ),
          ],
        ),
      ),
    );
  }
}