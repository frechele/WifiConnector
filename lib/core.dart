import 'dart:convert';
import 'dart:ui';

import 'package:easy_wifi_connect/easy_wifi_connect.dart';
import 'package:qr_flutter/qr_flutter.dart';

Future<String?> connectWifi({required String ssid, required String password}) {
  return EasyWifiConnect.connectWifi(ssid, password);
}

QrImage generateQR(Object object) {
  final jsonStr = jsonEncode(object);

  return QrImage(
    data: jsonStr,
    version: QrVersions.auto,
    size: 200
  );
}
