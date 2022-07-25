import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orilla_fresca/helpers/utils.dart';
import 'package:orilla_fresca/services/category_service.dart';
import 'package:provider/provider.dart';
import '../helpers/constants.dart';
import '../widgets/icon_font_widget.dart';


class SplashPage extends StatelessWidget {

  final int duration;
  final Widget goToPage;

  SplashPage({required this.duration, required this.goToPage});

  @override
  Widget build(BuildContext context) {

    CategoryService catService = Provider.of<CategoryService>(context, listen: false);

    Future.delayed(Duration(seconds: this.duration), () async {

      FirebaseApp app = await Firebase.initializeApp();

      catService.getCategoriesCollectionFromFirebase().then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => this.goToPage));
      });
    });

    return Scaffold(
      body: Container(
        color: AppColors.GREEN,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: IconFont(
                iconName: IconFontHelper.LOGO,
                color: Colors.white,
                size: 80.0,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 150.0,
                height: 150.0,
                child: CircularProgressIndicator(
                  strokeWidth: 6.0,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}