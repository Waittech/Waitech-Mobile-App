import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';

import 'package:waitech/main.dart';
import 'package:http/http.dart' as http;
import 'package:waitech/models/models.dart';
import 'package:waitech/models/restaurant_model.dart';
import 'package:waitech/riverpod/riverpod_management.dart';
import 'package:waitech/screens/restaurant_details/restaurant_detail_screen.dart';
import 'package:waitech/services/login_services.dart';
import '../profile/profile_screen.dart';

class QRCodeScanner extends ConsumerStatefulWidget {
  static const String routeName = '/qr_code';


  static Route route() {
    return MaterialPageRoute(
        builder: (_) => QRCodeScanner(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  ConsumerState<QRCodeScanner> createState() => _QRCodeScanner();
}

class _QRCodeScanner extends ConsumerState<QRCodeScanner> {
  late final Data restaurant;


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
              /*overlay: QrScannerOverlayShape(
                borderRadius: 10,
                borderLength: 20,
                borderWidth: 10,
                cutOutSize: MediaQuery.of(context).size.width*0.8,

              ),*/
              key: qrKey,
              onQRViewCreated: _onQrViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text('${result!.code}')
                  : const Text("Scan a code"),
            ),
          ),
        ],
      ),
    );
  }


  void _onQrViewCreated(QRViewController controller) {
    final storage = new FlutterSecureStorage();
    this.controller;
    controller.scannedDataStream.listen((scanData) async {
      result = scanData;
      if(result!=null){
        String? url = scanData!.code;
        print('url burada');
        print(url);
        String? companyId = url?.split('/')[5];
        String? tableId = url?.split('/')[7];
        print(scanData);
        await storage.write(key: 'url', value: url);
        await storage.write(key: 'companyId', value: companyId);
        await storage.write(key: 'tableId', value: tableId);
        goRestaurant(companyId);

      }

    });
  }

  Future<QrModel> fetchQr(String url) async {
    String? token = await storage.read(key: 'jwt');
    final response = await http
        .get(Uri.parse(url),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
      String jsonsDataString = response.body.toString(); // Error: toString of Response is assigned to jsonDataString.
      var _data = QrModel.fromJson(jsonDecode(jsonsDataString));
      var data=jsonEncode(_data);
      return QrModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  void goRestaurant(String? companyId) {
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
        RestaurantDetailScreen(companyId: int.parse(companyId!)
        ),
    ));
  }
}


