import 'package:finalcrisis/config/constant.dart';
import 'package:flutter/material.dart';

class cellApp extends StatefulWidget {
  const cellApp({Key? key}) : super(key: key);

  @override
  _cellAppState createState() => _cellAppState();
}

class _cellAppState extends State<cellApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
        height: 640,
        width: 411.4,
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
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 120,
              child: Text(
                'Cell App',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 110,
              right: 35,
              child: Container(
                width: 220 * 0.7,
                height: 80 * 0.7,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: pColor)),
                    color: pColor,
                    textColor: Colors.white,
                    child: Text(
                      'รับฟัง',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {}),
              ),
            ),
            Positioned(
              top: 170,
              left: 20,
              child: Image.asset(
                "asset/images/—Pngtree—psychological counselor relieves worries_5401408.png",
                height: 300,
              ),
            ),
            Positioned(
              bottom: 70,
              left: 35,
              child: Container(
                width: 220 * 0.7,
                height: 80 * 0.7,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: pColor)),
                    color: pColor,
                    textColor: Colors.white,
                    child: Text(
                      'ปรึกษา',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
