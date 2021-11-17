import 'package:finalcrisis/config/constant.dart';
import 'package:finalcrisis/screen/routes/1Introduction/audiobook/DetailaudiobookPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class audiobook extends StatelessWidget {
  const audiobook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color_Theme,
      body: Container(
        child: ListView(
          children: const <Widget>[
            SizedBox(
              height: 2 * 3.5,
            ),
            book(),
            SizedBox(
              height: 1 * 0.01,
            ),
            book(),
            SizedBox(
              height: 1 * 0.01,
            ),
            book(),
            SizedBox(
              height: 1 * 0.01,
            ),
            book(),
            SizedBox(
              height: 1 * 0.01,
            ),
            book(),
            SizedBox(
              height: 1 * 0.01,
            ),
            book(),
            SizedBox(
              height: 1 * 0.01,
            ),
            book(),
            SizedBox(
              height: 1 * 0.01,
            ),
            book(),
            SizedBox(
              height: 1 * 0.01,
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
    return Card(
      child: ListTile(
        leading: Icon(
          FontAwesomeIcons.book,
          color: Colors.grey[500],
          size: 45,
        ),
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
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailaudiobookPage()));
        },
      ),
    );
  }
}
