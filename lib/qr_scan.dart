import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import 'result_page.dart';

class QRScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanPage();
}

class _QRScanPage extends State<QRScanPage> {
  Barcode? result;
  QRViewController? qrController;
  final qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project WIFI"),
      ),
      body: Center(
        child: QRView(
          cameraFacing: CameraFacing.back,
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderRadius: 10,
            borderWidth: 5,
            borderColor: Colors.white,
          ),
        ),
      )
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    qrController = controller;

    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();

      try {
        final qrData = jsonDecode(scanData.code!);

        var data = <String, dynamic>{
          'id': qrData['id'],
          'pw': qrData['pw']
        };

        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ResultPage(data: data)
            )
        );
      } catch (e) {
        Fluttertoast.showToast(
          msg: 'invalid qr code',
          backgroundColor: Colors.black,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM
        );

        Navigator.pop(context);
      }
    });
  }
}
