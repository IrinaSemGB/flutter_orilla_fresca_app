import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orilla_fresca/pages/categories_page.dart';
import 'package:orilla_fresca/pages/details_page.dart';
import 'package:orilla_fresca/pages/maps_page.dart';
import 'package:orilla_fresca/pages/poster_page.dart';
import 'package:orilla_fresca/pages/selected_category_page.dart';
import 'package:orilla_fresca/pages/splash_page.dart';
import 'package:orilla_fresca/pages/welcome_page.dart';
import 'package:orilla_fresca/services/cart_service.dart';
import 'package:orilla_fresca/services/category_selection_service.dart';
import 'package:orilla_fresca/services/login_service.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => LoginService(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategorySelectionService(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartService(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Raleway',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(duration: 3, goToPage: WelcomePage()),
          '/welcome_page': (context) => WelcomePage(),
          '/categories_page': (context) => CategoriesPage(),
          '/selected_category_page': (context) => SelectedCategoryPage(),
          '/details_page': (context) => DetailsPage(),
          '/map_page': (context) => MapsPage(),
          '/poster_page': (context) => PosterPage(),
        },
      ),
    ),
  );
}
