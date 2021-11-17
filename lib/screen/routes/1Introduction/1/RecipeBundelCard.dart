import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecipeBundelCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.65,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(18 * 1.8),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20 * 2),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Text(
                      "หนังสือเสียง",
                      style: TextStyle(fontSize: 11 * 2.2, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 5 * 0.5),
                    Text(
                      "หนังสือเสียง              ",
                      style: TextStyle(color: Colors.white54),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.youtube,
                          color: Colors.red,
                        ),
                        SizedBox(width: 20 * 0.5),
                        Text('หนังสือเสียง'),
                      ],
                    ),
                    SizedBox(width: 5 * 0.5),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.youtube,
                          color: Colors.red,
                        ),
                        SizedBox(width: 20 * 0.5),
                        Text('หนังสือเสียง'),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(width: 55 * 0.5),
            AspectRatio(
              aspectRatio: 0.71,
              child: Image.asset(
                "asset/images/—Pngtree—child at home cartoon illustration_3873783.png",
                height: 100,
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
