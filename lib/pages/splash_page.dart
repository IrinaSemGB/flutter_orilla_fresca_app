import 'package:flutter/material.dart';
import '../helpers/constants.dart';
import '../widgets/icon_font_widget.dart';

class SplashPage extends StatelessWidget {

  final int duration;
  final Widget goToPage;

  SplashPage({required this.duration, required this.goToPage});

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage)
      );
    });

    return Scaffold(
      body: Container(
        color: AppColors.GREEN,
        alignment: Alignment.center,
        child: IconFont(
          iconName: IconFontHelper.LOGO,
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}