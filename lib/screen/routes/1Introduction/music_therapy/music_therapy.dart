import 'package:finalcrisis/config/constant.dart';
import 'package:finalcrisis/screen/routes/1Introduction/music_therapy/DetailAudioPage.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class music_therapy extends StatelessWidget {
  const music_therapy({Key? key}) : super(key: key);

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
            music(),
            SizedBox(
              height: 1 * 0.01,
            ),
            music(),
            SizedBox(
              height: 1 * 0.01,
            ),
            music(),
            SizedBox(
              height: 1 * 0.01,
            ),
            music(),
            SizedBox(
              height: 1 * 0.01,
            ),
            music(),
            SizedBox(
              height: 1 * 0.01,
            ),
            music(),
            SizedBox(
              height: 1 * 0.01,
            ),
            music(),
            SizedBox(
              height: 1 * 0.01,
            ),
            music(),
            SizedBox(
              height: 1 * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}

class music extends StatelessWidget {
  const music({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.headphones,
          size: 50,
        ),
        title: Text(
          'ดนตรีบำบัดความเครียด',
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
            Text('Jz knowledge'),
          ],
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailAudioPage()));
        },
      ),
    );
  }
}
