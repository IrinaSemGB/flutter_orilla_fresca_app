import 'package:flutter/material.dart';
import 'package:orilla_fresca/helpers/constants.dart';
import 'package:orilla_fresca/helpers/utils.dart';
import 'package:orilla_fresca/services/login_service.dart';
import 'package:orilla_fresca/widgets/icon_font_widget.dart';
import 'package:provider/provider.dart';
import '../widgets/login_button_widget.dart';


class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    LoginService loginService = Provider.of<LoginService>(context, listen: false);

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/images/of_main_bg.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ClipOval(
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        color: AppColors.GREEN,
                        alignment: Alignment.center,
                        child: IconFont(
                          iconName: IconFontHelper.MAIN_LOGO,
                          color: Colors.white,
                          size: 80.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Text(
                    'Bienvenido',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Text(
                    'Productos Frescos.\nSaludables. A Tiempo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  LoginButton(
                    onPressed: () {
                      Utils.mainAppNav.currentState?.pushNamed('/main_page');
                    },
                    name: 'Tratar Ahora!',
                    nameColor: Colors.white,
                    backgroundColor: AppColors.GREEN,
                    border: BorderSide(
                      color: AppColors.GREEN,
                    ),
                  ),
                  LoginButton(
                    name: 'Hacer Posters',
                    nameColor: Colors.white,
                    backgroundColor: AppColors.DARK_GREEN,
                    border: BorderSide(
                      color: AppColors.DARK_GREEN,
                    ),
                    onPressed: () {
                      Utils.mainAppNav.currentState?.pushNamed('/poster_page');
                    },
                  ),
                  LoginButton(
                    onPressed: () async {
                      bool success = await loginService.signInWithGoogle();
                      if (success) {
                        Utils.mainAppNav.currentState?.pushNamed('/main_page');
                      }
                    },
                    name: 'Hacer Login',
                    nameColor: AppColors.GREEN,
                    backgroundColor: Colors.transparent,
                    border: BorderSide(
                      color: AppColors.GREEN,
                      width: 4.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



