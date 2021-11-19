import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers_api.dart';
import 'package:flutter/material.dart';

class DetailaudiobookPage extends StatefulWidget {
  const DetailaudiobookPage({Key? key}) : super(key: key);

  @override
  _DetailaudiobookPageState createState() => _DetailaudiobookPageState();
}

class _DetailaudiobookPageState extends State<DetailaudiobookPage> {
  late AudioPlayer audvancedPlayer;

  @override
  void initState() {
    super.initState();
    audvancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHigth = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFfdee7fa),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHigth / 3,
            child: Container(
              color: Colors.greenAccent,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                ),
                onPressed: () {
                  audvancedPlayer.stop();
                  Navigator.of(context).pop();
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {},
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: screenHigth * 0.2,
            height: screenHigth * 0.37,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: screenWidth * 0.15,
                  ),
                  Text(
                    "เราเป็นผู้ใหญ่แล้วหรือยัง",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir",
                    ),
                  ),
                  Text(
                    "หนังสือเสียง เล่าให้ฟัง by ณหนวด",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  AudioFile(advancedPlayer: audvancedPlayer),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHigth * 0.12,
            left: (screenWidth - 110) / 2,
            right: (screenWidth - 110) / 2,
            height: screenHigth * 0.16,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                      image: AssetImage("asset/images/Capture.PNG"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  const AudioFile({Key? key, required this.advancedPlayer}) : super(key: key);

  @override
  _AudioFileState createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = Duration();
  Duration _position = Duration();
  final String path =
      "https://firebasestorage.googleapis.com/v0/b/final-crisis-156c1.appspot.com/o/%E0%B9%80%E0%B8%A3%E0%B8%B2%E0%B9%80%E0%B8%9B%E0%B9%87%E0%B8%99%E0%B8%9C%E0%B8%B9%E0%B9%89%E0%B9%83%E0%B8%AB%E0%B8%8D%E0%B9%88%20%E0%B8%AB%E0%B8%A3%E0%B8%B7%E0%B8%AD%E0%B8%A2%E0%B8%B1%E0%B8%87%E0%B8%99%E0%B8%B0%20%E3%80%90%E0%B8%AB%E0%B8%99%E0%B8%B1%E0%B8%87%E0%B8%AA%E0%B8%B7%E0%B8%AD%E0%B9%80%E0%B8%AA%E0%B8%B5%E0%B8%A2%E0%B8%87%20%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%B2%E0%B9%83%E0%B8%AB%E0%B9%89%E0%B8%9F%E0%B8%B1%E0%B8%87%E3%80%91%20%F0%9F%8E%A7%20by%20%E0%B8%93.%E0%B8%AB%E0%B8%99%E0%B8%A7%E0%B8%94.mp3?alt=media&token=bcd83bcf-8773-47db-9eb1-56c85089a137";
  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;
  Color color = Colors.black;
  List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    super.initState();
    this.widget.advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    this.widget.advancedPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
    //this.widget.advancedPlayer.setUrl(path);
    this.widget.advancedPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        if (isRepeat == true) {
          isPlaying = false;
        } else {
          isRepeat = false;
        }
      });
    });
  }

  Widget btnStart() {
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10),
      icon: isPlaying == false
          ? Icon(
              _icons[0],
              size: 50,
              color: Colors.blue,
            )
          : Icon(
              _icons[1],
              size: 50,
              color: Colors.blue,
            ),
      onPressed: () {
        if (isPlaying == false) {
          this.widget.advancedPlayer.play(path);
          setState(() {
            isPlaying = true;
          });
        } else if (isPlaying == true) {
          this.widget.advancedPlayer.pause();
          setState(() {
            print("123");
            // ignore: unnecessary_statements
            isPlaying = false;
            print(isPlaying);
          });
        }
      },
    );
  }

  Widget btnFast() {
    return IconButton(
        icon: Icon(
          Icons.skip_next,
        ),
        iconSize: 30,
        color: Colors.black,
        onPressed: () {
          this.widget.advancedPlayer.setPlaybackRate(1.5);
        });
  }

  Widget btnSlow() {
    return IconButton(
        icon: Icon(
          Icons.skip_previous,
        ),
        iconSize: 30,
        color: Colors.black,
        onPressed: () {
          this.widget.advancedPlayer.setPlaybackRate(0.5);
        });
  }

  Widget btnLoop() {
    return IconButton(
      icon: Icon(
        Icons.replay,
        color: Colors.white,
      ),
      iconSize: 30,
      color: Colors.black,
      onPressed: () {},
    );
  }

  Widget btnRepeat() {
    return IconButton(
      icon: Icon(
        Icons.loop,
        color: color,
      ),
      iconSize: 30,
      color: Colors.black,
      onPressed: () {
        if (isRepeat == false) {
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.LOOP);
          setState(() {
            isRepeat = true;
            color = Colors.blue;
          });
        } else if (isRepeat == true) {
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.RELEASE);
          color = Colors.black;
          isRepeat = false;
        }
      },
    );
  }

  Widget slider() {
    return Slider(
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });
        });
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    this.widget.advancedPlayer.seek(newDuration);
  }

  Widget loadAsset() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnRepeat(),
          btnSlow(),
          btnStart(),
          btnFast(),
          btnLoop(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _position.toString().split(".")[0],
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  _duration.toString().split(".")[0],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          slider(),
          loadAsset(),
        ],
      ),
    );
  }
}
