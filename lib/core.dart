import 'dart:typed_data';
import 'dart:ui';
import 'dart:convert';

import 'package:easy_wifi_connect/easy_wifi_connect.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

Future<String?> ConnectWifi({required String ssid, required String password}) {
  return EasyWifiConnect.connectWifi(ssid, password);
}

Future<Uint8List> GenerateQR(Object object) async {
  final jsonStr = jsonEncode(object);

  final image = await QrPainter(
    data: jsonStr,
    version: QrVersions.auto,
    gapless: false,
    color: Colors.black,
    emptyColor: Colors.white
  ).toImage(300);

  final buf = await image.toByteData(format: ImageByteFormat.png);
  return buf!.buffer.asUint8List();
}
