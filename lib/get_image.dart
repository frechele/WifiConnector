import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageGetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageGetPage();
  }
}

class _ImageGetPage extends State<ImageGetPage> {
  PickedFile? _image;

  Future getImageFromCamera() async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image!;
    });
  }

  Future getImageFromGallery() async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Project WIFI"),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Center(
                  child: _image == null
                      ? Text('No image selected.')
                      : Image.file(File(_image!.path), height: 500),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: getImageFromCamera,
                      child: Icon(Icons.add_a_photo),
                    ),
                    FloatingActionButton(
                      onPressed: getImageFromGallery,
                      child: Icon(Icons.wallpaper),
                    )
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton(
                    child: Text("Back to main page"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ));
  }
}
