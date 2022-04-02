import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orilla_fresca/pages/categories_page.dart';
import 'package:orilla_fresca/pages/maps_page.dart';
import 'package:orilla_fresca/pages/poster_page.dart';
import 'package:orilla_fresca/pages/splash_page.dart';
import 'package:orilla_fresca/pages/welcome_page.dart';
import 'package:orilla_fresca/services/login_service.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Provider(
    create: (_) => LoginService(),
    child: MaterialApp(
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      debugShowCheckedModeBanner: false,
      home: SplashPage(duration: 3, goToPage: WelcomePage()),
    ),
  ));
}
