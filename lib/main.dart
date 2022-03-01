import 'package:flutter/material.dart';

import 'get_image.dart';
import 'qr_scan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Project WIFI",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Project WIFI"),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                const Icon(
                  Icons.wifi_find,
                  size: 100,
                ),
                const SizedBox(height: 30),
                const Text("Connect wifi with camera",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                SizedBox(height: 30),
                ElevatedButton(
                  child: const Text("Get image"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ImageGetPage()));
                  },
                ),
                ElevatedButton(
                  child: const Text("QR scan"),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (_) => QRScanPage())
                    );
                  }
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ));
  }
}
