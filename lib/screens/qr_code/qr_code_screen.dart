import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';

import 'package:waitech/main.dart';
import 'package:http/http.dart' as http;
import 'package:waitech/models/models.dart';
import 'package:waitech/models/restaurant_model.dart';
import 'package:waitech/screens/restaurant_details/restaurant_detail_screen.dart';

import '../../services/qr_service.dart';

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
  /*late Future<QrModel> futureQR;

  @override
  void initState() {
    super.initState();
    futureQR = fetchQr(url);
  }*/

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
    this.controller;
    controller.scannedDataStream.listen((scanData) {
        result = scanData;
        if(result!=null){
          String? url = scanData!.code;
          String? companyId = url?.split('/')[6];
          String? tableId = url?.split('/')[8];
          /*goRestaurant(companyId);*/
          fetchQr();
          goRestaurant(companyId);
        }

    });
  }

  Future<QrModel> fetchQr() async{
    String? url =result!.code;
    final response = await http.get(Uri.parse(url!));
    if (response.statusCode==200){
      /*print(QrModel.fromJson(jsonDecode(response.body)));*/
      var result=QrModel.fromJson(jsonDecode(response.body));
      return result;
    }
    else{
      throw Exception('Failed to load QR');
    }
  }

  void goRestaurant(String? CompanyId) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
        RestaurantDetailScreen(
            restaurant: Restaurant.restaurants[int.parse(CompanyId!)]
        ),
    ));
   /* Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        RestaurantDetailScreen(
            restaurant: Restaurant.restaurants[ref.watch(companyId)+1]
        ),
    ));*/


  }

  
  }
/*class MyCameraApp extends StatefulWidget {
  const MyCameraApp({super.key});

  @override
  _MyCameraAppState createState() => _MyCameraAppState();
}

class _MyCameraAppState extends State<MyCameraApp> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return CameraPreview(_controller);
  }
}*/




