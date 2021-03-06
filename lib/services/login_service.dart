import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:orilla_fresca/models/login_user_model.dart';

class LoginService extends ChangeNotifier {

  LoginService() {
    Firebase.initializeApp();
  }

  LoginUserModel? _userModel;

  LoginUserModel? get loggedInUserModel => _userModel;

  Future<bool> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      return false;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    ) as GoogleAuthCredential;

    UserCredential userCreds = await FirebaseAuth.instance.signInWithCredential(credential);

    if (userCreds.user != null) {
      _userModel = LoginUserModel(
        displayName: userCreds.user?.displayName,
        email: userCreds.user?.email,
        photoUrl: userCreds.user?.photoURL,
        uid: userCreds.user?.uid,
      );
    }

    notifyListeners();
    return true;
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    _userModel = null;
  }

  bool isUserLoggedIn() {
    return _userModel != null;
  }
}