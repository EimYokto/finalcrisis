import 'package:finalcrisis/config/constant.dart';
import 'package:finalcrisis/provider/home_page.dart';
import 'package:finalcrisis/index.dart';
import 'package:finalcrisis/home.dart';
import 'package:finalcrisis/screen/routes/image.dart';
import 'package:finalcrisis/screen/routes/location.dart';
import 'package:finalcrisis/screen/routes/video.dart';
import 'screen/routes/profile.dart';
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
          "video": (context) => video(),
          "image": (context) => Images(),
          "location": (context) => Location(),
          "index": (context) => Index(),
          "profile": (context) => profile(),
        },
        home: HomePage(),
      ),
    );
  }
}
