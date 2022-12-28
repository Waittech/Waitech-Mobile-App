import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waitech/models/models.dart';
class QrService{
  Future<QrModel> fetchQr() async {
    final response = await http
        .get(Uri.parse('https://amazing-gauss.213-142-157-85.plesk.page/api/qr/company/2/table/2'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return QrModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }


}
