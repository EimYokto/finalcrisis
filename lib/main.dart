import 'package:finalcrisis/config/constant.dart';
import 'package:finalcrisis/provider/home_page.dart';
import 'package:finalcrisis/index.dart';
import 'package:finalcrisis/home.dart';
import 'package:finalcrisis/screen/routes/1Introduction/DetailAudioPage.dart';
import 'package:finalcrisis/screen/routes/1Introduction/music_therapy.dart';

import 'package:finalcrisis/screen/routes/2favorite/angry.dart';
import 'package:finalcrisis/screen/routes/2favorite/beard.dart';
import 'package:finalcrisis/screen/routes/2favorite/favorite.dart';
import 'package:finalcrisis/screen/routes/2favorite/stressed.dart';
import 'package:finalcrisis/screen/routes/3ChatApp/chat3.dart';
import 'package:finalcrisis/screen/routes/profile/profile1.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:finalcrisis/provider/google_sing_in.dart';
import 'package:provider/provider.dart';

import 'backend/firebaseregister.dart';

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
        debugShowCheckedModeBanner: false,
        title: 'Smart Heal',
        theme: ThemeData(
          primaryColor: pColor,
          secondaryHeaderColor: sColor,
          primarySwatch: Colors.green,
        ),
        routes: {
          "dashboard": (context) => Dashboard(),
          "index": (context) => Index(),
          "profile1": (context) => profile1(),
          "favorite": (context) => favorite(),
          "register": (context) => FirebaseRegister(),
          "stressed": (context) => stressed(),
          "beard": (context) => beard(),
          "angry": (context) => angry(),
          'chat3': (context) => chat3(),
          "music_therapy": (context) => music_therapy(),
        },
        home: HomePage(),
      ),
    );
  }
}
