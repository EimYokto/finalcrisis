import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class video extends StatefulWidget {
  const video({Key? key}) : super(key: key);

  @override
  _videoState createState() => _videoState();
}

class _videoState extends State<video> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("video"),
      ),
      body: Center(
        child: BetterPlayer.network(
          "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
          betterPlayerConfiguration: BetterPlayerConfiguration(
            looping: true,
            autoPlay: true,
          ),
        ),
      ),
    );
  }
}
