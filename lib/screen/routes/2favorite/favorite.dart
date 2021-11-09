import 'package:finalcrisis/config/constant.dart';
import 'package:flutter/material.dart';

class favorite extends StatelessWidget {
  const favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        child: Row(
          children: [
            Container(
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
                child: Column(
                  children: [
                    Text(
                      'แบบประเมิน',
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 70 * 0.4,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: sFont,
                        ),
                        primary: Color_white,
                        onPrimary: Colors.red,
                        padding: EdgeInsets.all(15.0),
                      ),
                      icon: Image.asset(
                        "asset/images/Mad.png",
                        height: 110,
                      ),
                      label: Text('        เคลียดมั้ย       '),
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 70 * 0.4,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: sFont,
                        ),
                        primary: Color_white,
                        onPrimary: Colors.red,
                        padding: EdgeInsets.all(15.0),
                      ),
                      icon: Image.asset(
                        "asset/images/—Pngtree—sad mood face expression boy_5950485.png",
                        height: 110,
                      ),
                      label: Text('          เศร้ามั้ย         '),
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 70 * 0.4,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: sFont,
                        ),
                        primary: Color_white,
                        onPrimary: Colors.red,
                        padding: EdgeInsets.all(15.0),
                      ),
                      icon: Image.asset(
                        "asset/images/—Pngtree—a boy throw tantrum illustration_6832735.png",
                        height: 110,
                      ),
                      label: Text('          โกรธมั้ย         '),
                      onPressed: () {},
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
