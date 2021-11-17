import 'package:finalcrisis/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class audiobook extends StatelessWidget {
  const audiobook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 2 * 3.5,
                  ),
                  book(),
                  book(),
                  book(),
                  book(),
                  book(),
                  book(),
                  SizedBox(
                    height: 1 * 0.01,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class book extends StatelessWidget {
  const book({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18 * 1.8)),
      child: Flexible(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            child: ListTile(
              leading: Icon(
                FontAwesomeIcons.book,
                color: Colors.grey[500],
                size: 45,
              ),

              //color: Colors.red,
              //size: 50,

              title: Text(
                'เราเป็นผู้ใหญ่แล้วหรือยัง',
              ),
              subtitle: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.youtube,
                    color: Colors.red,
                    size: 15,
                  ),
                  SizedBox(
                    width: 2 * 3.5,
                  ),
                  Text('หนังสือเสียง เล่าให้ฟัง by ณหนวด'),
                ],
              ),
              //trailing: Icon(Icons.more_vert),
              onTap: () {
                print("123");
              },
            ),
          ),
        ),
      ),
    );
  }
}
