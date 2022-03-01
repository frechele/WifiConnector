import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:wifi_connector_app/core.dart';

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

    list['qr'] = generateQR(list);

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project WIFI"),
      ),
      body: Center(
        child: FutureBuilder(
          future: getResponse(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data as Map<String, dynamic>;

              final id = data['id'];
              final pw = data['pw'];

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  data['qr'],
                  Text('ID: $id'),
                  Text('PW: $pw')
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(),
                  Text('processing')
                ]
              );
            }
          }
        )
      )
    );
  }
}
