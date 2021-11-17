import 'package:finalcrisis/config/constant.dart';
import 'package:finalcrisis/screen/routes/2favorite/Question_stressed.dart';
import 'package:flutter/material.dart';

enum SingingCharacter {
  Yse,
  No,
}
enum nun1 {
  Yse,
  No,
}

class stressed extends StatefulWidget {
  const stressed({Key? key}) : super(key: key);

  @override
  _stressedState createState() => _stressedState();
}

class _stressedState extends State<stressed> {
  //a1? _character = a1.Yse;
  SingingCharacter? _character = SingingCharacter.Yse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
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
        child: Container(
          color: Colors.white,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        '      1. จงหาคำตอบของ 1 + 1',
                        style: TextStyle(fontSize: 25),
                      ),
                      ListTile(
                        title: const Text(
                          'Yse',
                          style: TextStyle(fontSize: 20),
                        ),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.Yse,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('No'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.No,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
