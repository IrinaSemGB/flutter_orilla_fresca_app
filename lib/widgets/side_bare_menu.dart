import 'package:flutter/material.dart';
import 'package:orilla_fresca/helpers/constants.dart';
import 'package:orilla_fresca/pages/welcome_page.dart';
import 'package:orilla_fresca/services/login_service.dart';
import 'package:orilla_fresca/widgets/icon_font_widget.dart';
import 'package:provider/provider.dart';
import '../pages/categories_page.dart';

class SideBarMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    LoginService loginService = Provider.of<LoginService>(context, listen: false);
    bool userLoggedIn = loginService.loggedInUserModel != null;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50.0),
        color: AppColors.GREEN,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              onPressed: () async {
                if (userLoggedIn) {
                  await loginService.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomePage(),
                    ),
                  );
                } else {
                  bool success = await loginService.signInWithGoogle();
                  if (success) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoriesPage(),
                      ),
                    );
                  }
                }
              },
              child: Row(
                children: [
                  Icon(userLoggedIn ? Icons.logout : Icons.login,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    userLoggedIn ? 'Sign out' : 'Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ],
              ),
            ),
            IconFont(
              iconName: IconFontHelper.LOGO,
              color: Colors.white,
              size: 70.0,
            ),
          ],
        ),
      ),
    );
  }
}
