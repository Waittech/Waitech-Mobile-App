import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';

class QRCodeScanner extends StatefulWidget {
  static const String routeName = '/qr_code';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => QRCodeScanner(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<QRCodeScanner> createState() => _QRCodeScanner();
}

class _QRCodeScanner extends State<QRCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Kodu Okutun'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQrViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      "Barcode Type: ${describeEnum(result!.format)} Data: ${result!.code}")
                  : const Text("Scan a code"),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context)=> QRView(
      key: qrKey, onQRViewCreated: _onQrViewCreated,
    overlay: QrScannerOverlayShape(
      borderColor: Theme.of(context).primaryColor,
      borderRadius: 10,
      borderLength: 20,
      borderWidth: 10,
      cutOutSize: MediaQuery.of(context).size.width*0.8,
    ),
  );

  void _onQrViewCreated(QRViewController controller) {
    this.controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        print(result);
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
