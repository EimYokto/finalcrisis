import 'package:finalcrisis/config/constant.dart';
import 'package:flutter/material.dart';

class Categaries extends StatefulWidget {
  @override
  _CategariesState createState() => _CategariesState();
}

class _CategariesState extends State<Categaries> {
  List<String> categaries = ["All", "music", "audio book", "article"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5 * 2),
      child: SizedBox(
        height: 8 * 3.5,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categaries.length,
            itemBuilder: (context, index) => builCatCategoriItem(index)),
      ),
    );
  }

  Widget builCatCategoriItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 15 * 2),
        padding: EdgeInsets.symmetric(
          horizontal: 8 * 2,
          vertical: 5 * 0.5,
        ),
        decoration: BoxDecoration(
          color:
              selectedIndex == index ? Color(0xFFEFF3EE) : Colors.transparent,
          borderRadius: BorderRadius.circular(16 * 1.6),
        ),
        child: Text(
          categaries[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedIndex == index ? Color_Grey : Color(0xFFC2C2B5),
          ),
        ),
      ),
    );
  }
}
