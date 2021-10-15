import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Images extends StatefulWidget {
  const Images({Key? key}) : super(key: key);

  @override
  _ImagesState createState() => _ImagesState();

  static file(file) {}
}

class _ImagesState extends State<Images> {
  var file;

  Future<void> openCamera() async {
    var picker = ImagePicker();
    var phone = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(phone!.path);
    });

    print(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('image'),
      ),
      body: Center(
        child: file == null ? Text('Select image') : Images.file(file),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('open camera');
          openCamera();
        },
      ),
    );
  }
}
