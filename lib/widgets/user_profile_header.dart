import 'package:flutter/material.dart';
import 'package:orilla_fresca/models/login_user_model.dart';
import 'package:orilla_fresca/services/login_service.dart';
import 'package:provider/provider.dart';

class UserProfileHeader extends StatelessWidget {

  final bool showProfilePic;

  UserProfileHeader({
    this.showProfilePic = true,
  });

  @override
  Widget build(BuildContext context) {

    LoginService loginService = Provider.of<LoginService>(context, listen: false);
    LoginUserModel? userModel = loginService.loggedInUserModel;

    String? imagePath = userModel != null ? userModel.photoUrl : '';

    return showProfilePic && imagePath.toString().length > 0
        ? Container(
            margin: EdgeInsets.only(right: 10.0),
            padding: EdgeInsets.all(10.0),
            child: ClipOval(
              child: Image.network(imagePath!),
            ))
        : SizedBox(width: 40.0, height: 40.0);
  }
}
