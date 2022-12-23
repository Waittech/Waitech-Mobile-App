/*
import 'dart:convert';

import '';
import '../models/qr_model.dart';
import 'package:http/http.dart' as http;


Future<http.Response> getTable(){
  return http.get(Uri.parse(apiUrl));
}
Future<QrModel> fetchQr() async{
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode==200){
    return QrModel.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception('Failed to load QR');
  }
}*/
