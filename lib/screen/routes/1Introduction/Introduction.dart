import 'package:finalcrisis/screen/routes/1Introduction/audiobook/audiobook.dart';
import 'package:finalcrisis/screen/routes/1Introduction/music_therapy/music_therapy.dart';
import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Smart Heal",
            style: TextStyle(fontSize: 35),
          ),
          backgroundColor: Colors.greenAccent[400],
          elevation: 0,
          bottom: TabBar(
              labelColor: Colors.redAccent,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("audio book"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("music therapy"),
                  ),
                ),
              ]),
        ),
        body: TabBarView(children: [
          audiobook(),
          music_therapy(),
          //Icon(Icons.ac_unit),
          //Icon(Icons.ac_unit),
        ]),
      ),
    );
  }
}
