import 'package:finalcrisis/config/constant.dart';
import 'package:finalcrisis/provider/home_page.dart';
import 'package:finalcrisis/index.dart';
import 'package:finalcrisis/home.dart';

import 'package:finalcrisis/screen/routes/1Introduction/Introduction.dart';
import 'package:finalcrisis/screen/routes/2favorite/favorite.dart';
import 'package:finalcrisis/screen/routes/profile/profile1.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:finalcrisis/provider/google_sing_in.dart';
import 'package:provider/provider.dart';

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
        title: 'Smart Heal',
        theme: ThemeData(
          primaryColor: pColor,
          secondaryHeaderColor: sColor,
          primarySwatch: Colors.green,
        ),
        routes: {
          'dashboard': (context) => Dashboard(),
          "Introduction": (context) => Introduction(),
          "index": (context) => Index(),
          "profile1": (context) => profile1(),
          "favorite": (context) => favorite(),
        },
        home: HomePage(),
      ),
    );
  }
}
