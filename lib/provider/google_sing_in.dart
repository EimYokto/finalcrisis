import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    print("return0");
    try {
      if (googleUser == null) {
        return print("return");
      }
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
    print("googleLogin");
  }

  Future googleLogout() async {
    try {
      print("googleLogout1");
      await googleSignIn.disconnect();
      print("googleLogout2");
      FirebaseAuth.instance.signOut();
      print("googleLogout3");
    } catch (e) {
      print(e.toString());
      return FirebaseAuth.instance.signOut();
    }
  }

  /*Future Logout() async {
    FirebaseAuth.instance.signOut();
    print("googleLogout3");
  }*/
}
