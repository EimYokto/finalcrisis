import 'package:finalcrisis/config/constant.dart';
import 'package:flutter/material.dart';

class angry extends StatelessWidget {
  const angry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10),
              height: 700,
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
            ),
          ],
        ),
      ),
    );
  }
}
