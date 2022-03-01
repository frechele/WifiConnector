import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class ResultPage extends StatefulWidget {
  String imagePath;
  ResultPage({required this.imagePath});

  @override
  State<StatefulWidget> createState() {
    return _ResultPage();
  }
}

class _ResultPage extends State<ResultPage> {
  Future<Map> getResponse() async {
    final response = await http.post(
      Uri.http("211.104.118.60:10301", '/ocr_image/'),
      body: File(widget.imagePath).readAsBytesSync(),
    );

    Map<String, dynamic> list = json.decode(response.body);
    return list;
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
                Image.file(File(widget.imagePath), height: 400),
                SizedBox(height: 30),
                FutureBuilder(
                  future: getResponse(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Map<String, dynamic> t =
                          snapshot.data as Map<String, dynamic>;
                      return Text(t['id']);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return Text("Loading ...");
                    }
                  },
                ),
                SizedBox(height: 30),
                FutureBuilder(
                  future: getResponse(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Map<String, dynamic> t =
                          snapshot.data as Map<String, dynamic>;
                      return Text(t['pw']);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return Text("Loading ...");
                    }
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ));
  }
}
