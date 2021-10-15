import 'package:finalcrisis/screen/location.dart';
import 'package:finalcrisis/screen/image.dart';
import 'package:flutter/material.dart';

import 'package:finalcrisis/screen/video.dart';
import 'package:finalcrisis/index.dart';
import 'package:finalcrisis/screen/dashboard.dart';
import 'package:finalcrisis/screen/register.dart';

import 'config/constant.dart';
import 'screen/login.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        "location": (context) => location(),
        "index": (context) => Index(),
      },
      home: Index(),
    );
  }
}
