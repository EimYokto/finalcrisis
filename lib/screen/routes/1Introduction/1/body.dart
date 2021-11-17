import 'package:finalcrisis/screen/routes/1Introduction/1/Categaries.dart';
import 'package:finalcrisis/screen/routes/1Introduction/1/RecipeBundelCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Categaries(),
        Expanded(
          child: GridView.builder(
            itemCount: 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 1, childAspectRatio: 1.65),
            itemBuilder: (context, index) => RecipeBundelCard(),
          ),
        ),
      ],
    );
  }
}
