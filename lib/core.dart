import 'dart:convert';
import 'dart:ui';

import 'package:easy_wifi_connect/easy_wifi_connect.dart';
import 'package:qr_flutter/qr_flutter.dart';

Future<String?> ConnectWifi({required String ssid, required String password}) {
  return EasyWifiConnect.connectWifi(ssid, password);
}

Future<Image> GenerateQR(Object object) async {
  final jsonStr = jsonEncode(object);

  final painter = QrPainter(
    data: jsonStr,
    version: QrVersions.auto,
    gapless: false,
    color: const Color(0xFF000000),
    emptyColor: const Color(0xFFFFFFFF)
  );

  return await painter.toImage(300);
}
