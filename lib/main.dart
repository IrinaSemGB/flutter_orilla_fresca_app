import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orilla_fresca/pages/categories_page.dart';
import 'package:orilla_fresca/pages/details_page.dart';
import 'package:orilla_fresca/pages/maps_page.dart';
import 'package:orilla_fresca/pages/poster_page.dart';
import 'package:orilla_fresca/pages/selected_category_page.dart';
import 'package:orilla_fresca/pages/splash_page.dart';
import 'package:orilla_fresca/pages/welcome_page.dart';
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
        Provider(
          create: (_) => CategorySelectionService(),
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
          '/categories_page': (context) => CategoriesPage(), // required
          '/selected_category_page': (context) => SelectedCategoryPage(), // required
          '/details_page': (context) => DetailsPage(), // required
          '/map_page': (context) => MapsPage(), // required
          '/poster_page': (context) => PosterPage(),
        },
      ),
    ),
  );
}
