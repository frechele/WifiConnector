import 'package:easy_wifi_connect/easy_wifi_connect.dart';

Future<String?> ConnectWifi({required String ssid, required String password}) {
  return EasyWifiConnect.connectWifi(ssid, password);
}
