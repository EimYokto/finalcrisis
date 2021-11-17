import 'package:finalcrisis/screen/routes/1Introduction/1/body.dart';
import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Smart Heal",
          style: TextStyle(
            fontSize: 30,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          SizedBox(
            height: 10 * 0.5,
          ),
        ],
      ),
      body: body(),
    );
  }
}
