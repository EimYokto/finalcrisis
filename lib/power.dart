import 'dart:async';
import 'package:finalcrisis/config/constant.dart';
import 'package:finalcrisis/provider/home_page.dart';
import 'package:flutter/material.dart';

class powerscreen extends StatefulWidget {
  @override
  _powerscreenState createState() => _powerscreenState();
}

class _powerscreenState extends State<powerscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    });
  }

  // added test yourself
  // and made the text to align at center
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Container(
        padding: EdgeInsets.only(left: 10, top: 10, right: 10),
        height: 730,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color_Theme,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Image.asset(
              "asset/images/logo.png",
              width: size.width * 0.3,
              height: size.height * 0.3,
            ),
            Text(
              "Smart Heal",
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
