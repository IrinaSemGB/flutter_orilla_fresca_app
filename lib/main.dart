import 'package:flutter/material.dart';
import 'package:orilla_fresca/pages/categories_page.dart';
import 'package:orilla_fresca/pages/splash_page.dart';
import 'package:orilla_fresca/pages/welcome_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Raleway',
    ),
    debugShowCheckedModeBanner: false,
    home: SplashPage(
      duration: 3,
      goToPage: WelcomePage(),
    ),
  ));
}











