import 'package:finalcrisis/provider/home_page.dart';
import 'package:finalcrisis/screen/location.dart';
import 'package:finalcrisis/screen/image.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:finalcrisis/screen/video.dart';
import 'package:finalcrisis/index.dart';
import 'package:finalcrisis/screen/dashboard.dart';
import 'package:finalcrisis/screen/register.dart';
import 'package:finalcrisis/provider/google_sing_in.dart';
import 'package:provider/provider.dart';
import 'config/constant.dart';
import 'screen/login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'KMUTNB',
        theme: ThemeData(
          primaryColor: pColor,
          secondaryHeaderColor: sColor,
          primarySwatch: Colors.green,
        ),
        routes: {
          'login': (context) => Login(),
          'register': (context) => Register(),
          'dashboard': (context) => Dashboard(),
          "video": (context) => video(),
          "image": (context) => Images(),
          "location": (context) => Location(),
          "index": (context) => Index(),
        },
        home: HomePage(),
      ),
    );
  }
}
