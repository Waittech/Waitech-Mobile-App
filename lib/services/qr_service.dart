/*

import 'dart:convert';

import 'package:waitech/screens/qr_code/qr_code_screen.dart';

import '';
import '../models/qr_model.dart';
import 'package:http/http.dart' as http;
class QrService {
  final qrCodeScreen = QRCodeScanner();

  Future<QrModel> fetchQr() async {
    final response = await http.get(Uri.parse(''));
    if (response.statusCode == 200) {
      return QrModel.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('Failed to load QR');
    }
  }
}

*/
