import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:finalcrisis/config/constant.dart';
import 'package:finalcrisis/screen/routes/1Introduction/Introduction.dart';
//import 'package:finalcrisis/screen/routes/1Introduction/1/Introduction.dart';
import 'package:finalcrisis/screen/routes/2favorite/favorite.dart';
import 'package:finalcrisis/screen/routes/3ChatApp/chat3.dart';
import 'package:finalcrisis/screen/routes/4cellPhone/cellPhone.dart';

import 'package:finalcrisis/screen/routes/profile/profile1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var data;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screen = [
    Introduction(),
    favorite(),
    chat3(),
    cellApp(),
    profile1(),
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Container(
      child: SafeArea(
        top: false,
        child: Scaffold(
          extendBody: true,
          backgroundColor: Color_Theme,
          body: screen[index],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
            child: CurvedNavigationBar(
              key: navigationKey,
              color: Colors.green,
              buttonBackgroundColor: Colors.red,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 300),
              height: 60,
              index: index,
              items: <Widget>[
                Icon(Icons.home, size: 30),
                Icon(Icons.favorite, size: 30),
                Icon(Icons.chat, size: 30),
                Icon(Icons.phone, size: 30),
                Icon(Icons.person, size: 30),
              ],
              onTap: (index) => setState(() => this.index = index),
            ),
          ),
        ),
      ),
    );
  }
}
