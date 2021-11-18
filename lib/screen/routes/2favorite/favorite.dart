import 'package:finalcrisis/config/constant.dart';
import 'package:finalcrisis/screen/routes/2favorite/stressed/stressed.dart';
import 'package:flutter/material.dart';

class favorite extends StatefulWidget {
  const favorite({Key? key}) : super(key: key);

  @override
  _favoriteState createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
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
                        fontSize: 50,
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
                        onPrimary: Colors.black,
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.white)),
                      ),
                      icon: Image.asset(
                        "asset/images/Mad.png",
                        height: 100,
                      ),
                      label: Text('        เคลียดมั้ย       '),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => stressed()));
                      },
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
                        onPrimary: Colors.black,
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.white)),
                      ),
                      icon: Image.asset(
                        "asset/images/—Pngtree—sad mood face expression boy_5950485.png",
                        height: 100,
                      ),
                      label: Text('          เศร้ามั้ย         '),
                      onPressed: () {
                        Navigator.pushNamed(context, 'beard');
                      },
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
                        onPrimary: Colors.black,
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.white)),
                      ),
                      icon: Image.asset(
                        "asset/images/—Pngtree—a boy throw tantrum illustration_6832735.png",
                        height: 100,
                      ),
                      label: Text('          โกรธมั้ย         '),
                      onPressed: () {
                        Navigator.pushNamed(context, 'angry');
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
